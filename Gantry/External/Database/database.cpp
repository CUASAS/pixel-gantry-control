#include <iostream>
#include <iomanip>
#include <map>
#include <string>
#include <chrono>
#include <sstream>
#include <regex>
#include <mysql/jdbc.h>
#include "database.h"
#include "sha512.h"

using namespace std;
using namespace sql;

#define cp_to_buffer(buf, str) memcpy((buf) + (idx)*DB_STR_LEN, (str).c_str(), (str).size()+1 > DB_STR_LEN ? DB_STR_LEN : (str).size()+1)

int with_default(ResultSet *rs, unsigned int col_idx, int default_) {
    if (rs->isNull(col_idx)) return default_;
    else return rs->getInt(col_idx);
}

float with_default(ResultSet *rs, unsigned int col_idx, float default_) {
    if (rs->isNull(col_idx)) return default_;
    else return (float) rs->getDouble(col_idx);
}

string with_default(ResultSet *rs, unsigned int col_idx, string default_) {
    if (rs->isNull(col_idx)) return default_;
    else return rs->getString(col_idx);
}


int get_last_insert_id(sql::Connection *conn) {
    unique_ptr<sql::ResultSet> result(conn->createStatement()->executeQuery("SELECT last_insert_id()"));
    result->next();
    return result->getInt(1);
}

map<int, sql::Connection *> connections;
int conn_cntr = 0;

std::string get_current_utc_timestamp() {
    using namespace std;
    using namespace std::chrono;
    std::time_t now = system_clock::to_time_t(system_clock::now());
    stringstream ss;
    ss << put_time(std::gmtime(&now), "%Y-%m-%d %H:%M:%S");
    return ss.str();
}


int connect(const char *username, const char *password, const char *host, const char *schema, int port) {

    cout << "Connecting to host " << host << ":" << port << endl;
    try {
        sql::Driver *driver = sql::mysql::get_driver_instance();
        sql::Connection *conn = driver->connect(host, username, password);
        conn->setSchema(schema);
        connections[conn_cntr] = conn;
        conn_cntr++;
        return conn_cntr - 1;
    } catch (std::exception &e) {
        std::cout << e.what() << std::endl;
        std::cout << "Failed to connect" << std::endl;
        return -1;
    }
}

int disconnect(int conn_id) {
    sql::Connection *conn;
    try { conn = connections.extract(conn_id).mapped(); } catch (out_of_range &e) { return -1; }
    conn->close();
    delete conn;
    return 0;
}

int start_transaction(int conn_id) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }
    conn->setAutoCommit(false);
    return 0;
}

int rollback_transaction(int conn_id) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }
    conn->rollback();
    conn->setAutoCommit(true);
    return 0;
}

int finish_transaction(int conn_id) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }
    conn->commit();
    conn->setAutoCommit(true);
    return 0;
}

int query_parts(int conn_id, int *n_parts, char *part, int *version, char *description, char *prefix,
                float *dim_x, float *dim_y, float *dim_z, char *type) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "SELECT part, version, description, prefix, dim_x, dim_y, dim_z, type from parts"
    ));
    unique_ptr<sql::ResultSet> components(stmt->executeQuery());

    int idx = 0;
    while (components->next()) {
        if (idx >= DB_ARR_LEN) break;
        string row_part = with_default(components.get(), 1, "");
        int row_version = with_default(components.get(), 2, -1);
        string row_description = with_default(components.get(), 3, "");
        string row_prefix = with_default(components.get(), 4, "");
        float row_dim_x = with_default(components.get(), 5, -1.0f);
        float row_dim_y = with_default(components.get(), 6, -1.0f);
        float row_dim_z = with_default(components.get(), 7, -1.0f);
        string row_type = with_default(components.get(), 8, "");

        cp_to_buffer(part, row_part);
        *(version + idx) = row_version;
        cp_to_buffer(description, row_description);
        cp_to_buffer(prefix, row_prefix);
        *(dim_x + idx) = row_dim_x;
        *(dim_y + idx) = row_dim_y;
        *(dim_z + idx) = row_dim_z;
        cp_to_buffer(type, row_type);

        idx++;
    }
    *n_parts = idx;
    return 0;
}

int query_people(int conn_id, int *n_people, char *username, char *name, char *full_name, char *email, char *institute,
                 char *timezone) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "SELECT username, name, full_name, email, institute, timezone FROM people"
    ));
    unique_ptr<sql::ResultSet> people(stmt->executeQuery());

    int idx = 0;
    while (people->next()) {
        if (idx >= DB_ARR_LEN) break;

        string row_username = with_default(people.get(), 1, "");
        string row_name = with_default(people.get(), 2, "");
        string row_full_name = with_default(people.get(), 3, "");
        string row_email = with_default(people.get(), 4, "");
        string row_institute = with_default(people.get(), 5, "");
        string row_timezone = with_default(people.get(), 6, "");

        cp_to_buffer(username, row_username);
        cp_to_buffer(name, row_name);
        cp_to_buffer(full_name, row_full_name);
        cp_to_buffer(email, row_email);
        cp_to_buffer(institute, row_institute);
        cp_to_buffer(timezone, row_timezone);

        idx++;
    }
    *n_people = idx;
    return 0;
}

int check_login(int conn_id, const char *username, const char *password) {
    /*
     * Return
     *   0: Password check passed
     *   1: User exists & password failed
     *   2: User does not exist
     */
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement("SELECT password FROM people WHERE username = ?"));
    stmt->setString(1, username);
    unique_ptr<sql::ResultSet> people(stmt->executeQuery());

    if (people->rowsCount() != 1) {
        return 2;
    }
    people->next();
    string db_hashed = people->getString(1);
    string input_hashed = sha512(password);
    return db_hashed == input_hashed ? 0 : 1;
}

int query_components(int conn_id, const char *part, int version, int *n_component, int *id, char *status,
                     char *description, char *serial_number, char *location, int *parent) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "SELECT id, status, description, serial_number, location, parent FROM component "
            "WHERE part = ? AND version = ? "
            "ORDER BY serial_number"
    ));
    stmt->setString(1, part);
    stmt->setInt(2, version);
    unique_ptr<sql::ResultSet> components(stmt->executeQuery());

    int idx = 0;
    while (components->next()) {
        if (idx >= DB_ARR_LEN) break;

        int row_id = with_default(components.get(), 1, -1);
        string row_status = with_default(components.get(), 2, "");
        string row_description = with_default(components.get(), 3, "");
        string row_serial_number = with_default(components.get(), 4, "");
        string row_location = with_default(components.get(), 5, "");
        int row_parent = with_default(components.get(), 6, -1);

        *(id + idx) = row_id;
        cp_to_buffer(status, row_status);
        cp_to_buffer(description, row_description);
        cp_to_buffer(serial_number, row_serial_number);
        cp_to_buffer(location, row_location);
        *(parent + idx) = row_parent;

        idx++;
    }
    *n_component = idx;
    return 0;
}

int insert_component(int conn_id, const char *part, int version, const char *status, const char *description,
                     const char *who, const char *serial_number, const char *location) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    string creation_time = get_current_utc_timestamp();

    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "INSERT INTO component (part, version, status, description, who, serial_number, creation_time, location) "
            "VALUES (?,?,?,?,?,?,?,?)"
    ));
    stmt->setString(1, part);
    stmt->setInt(2, version);
    stmt->setString(3, status);
    stmt->setString(4, description);
    stmt->setString(5, who);
    stmt->setString(6, serial_number);
    stmt->setString(7, creation_time);
    stmt->setString(8, location);
    stmt->execute();

    return get_last_insert_id(conn);
}

int remove_component(int conn_id, int component_id) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "DELETE FROM component WHERE id = ?"
    ));
    stmt->setInt(1, component_id);
    stmt->execute();
    return 0;
}

int update_component(int conn_id, int id, const char *status, int parent) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "UPDATE component SET parent = ?, status = ? "
            "WHERE id = ?"
    ));
    stmt->setInt(1, parent);
    stmt->setString(2, status);
    stmt->setInt(3, id);
    stmt->execute();

    return 0;
}

int insert_log(int conn_id, const char *userid, const char *remote_ip, const char *type) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    string now = get_current_utc_timestamp();
    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "INSERT INTO logs (userid, remote_ip, type, date) "
            "VALUES (?,?,?,?)"
    ));
    stmt->setString(1, userid);
    stmt->setString(2, remote_ip);
    stmt->setString(3, type);
    stmt->setString(4, now);
    stmt->execute();

    return get_last_insert_id(conn);
}

int insert_test(int conn_id, const char *description, const char *data, int component_id, const char *type) {
    sql::Connection *conn;
    try { conn = connections.at(conn_id); } catch (out_of_range &e) { return -1; }

    string now = get_current_utc_timestamp();
    unique_ptr<sql::PreparedStatement> stmt(conn->prepareStatement(
            "INSERT INTO tests (date, description, data, part_id, type) "
            "VALUES (?,?,?,?,?)"
    ));
    stmt->setString(1, now);
    stmt->setString(2, description);
    stmt->setString(3, data);
    stmt->setInt(4, component_id);
    stmt->setString(5, type);
    stmt->execute();
    return get_last_insert_id(conn);
}
