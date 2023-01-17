//
// Created by Caleb on 2/15/2022.
//
#include <iostream>
#include "database.h"
#include "sha512.h"

using namespace std;

#define TEST(test_name, ...) {\
        std::cout << "Running Test: " << #test_name << "...  " << std::flush; \
        int code = -1;                                                        \
        try {                                                                 \
            code=test_name(__VA_ARGS__);                                      \
        } catch (exception &e) {                                              \
            cout << e.what() << endl;                                         \
        }                                                                     \
        if (code == 0) std::cout << "PASSED!" << std::endl;                   \
        else cout << "FAILURE! Exit-Code=" << code << std::endl;              \
    }

bool VERBOSE = false;

int test_update_component(int conn_id) {

    int comp_id = insert_component(conn_id, "test_part", 1,
                                   "test", "This is a test component", "Mr. Test",
                                   "TEST-001", "testsville");

    str_table_t status;
    str_table_t location;
    str_table_t description;
    str_table_t serial_number;
    int_table_t id;
    int_table_t parent;
    int n_component;

    update_component(conn_id, comp_id, "updated", 2);
    query_components(conn_id, "test_part", 1, &n_component, id, (char *) status, (char *) description,
                     (char *) serial_number, (char *) location, parent);
    remove_component(conn_id, comp_id);

    bool success = false;
    for (int i = 0; i < n_component; i++) {
        string comp_status = status[i];
        if (VERBOSE) {
            bool match = (comp_status == "updated");
            cout << "\"" << comp_status << R"(" == "updated")" << "? " << match << endl;
        }
        if (id[i] == comp_id && comp_status == "updated") {
            success = true;
            break;
        }
    }
    return success ? 0 : 1;
}

int test_query_parts(int conn_id) {
    int n_parts;
    str_table_t part;
    int_table_t version;
    str_table_t description;
    str_table_t prefix;
    float_table_t dim_x;
    float_table_t dim_y;
    float_table_t dim_z;
    str_table_t type;
    query_parts(conn_id, &n_parts, (char *) part, (int *) version, (char *) description, (char *) prefix,
                (float *) dim_x, (float *) dim_y, (float *) dim_z, (char *) type);
    if (VERBOSE) {
        for (int i = 0; i < n_parts; i++) {
            cout << (char *) part[i] << ", " << version[i] << ", " << description[i] << ", " << prefix[i] << endl;
        }
    }
    return n_parts > 0 ? 0 : 1;
}

int test_query_people(int conn_id) {
    int n_people;
    str_table_t username;
    str_table_t name;
    str_table_t full_name;
    str_table_t email;
    str_table_t institute;
    str_table_t timezone;

    query_people(conn_id, &n_people, (char *) username, (char *) name,
                 (char *) full_name, (char *) email, (char *) institute, (char *) timezone);
    if (VERBOSE) {
        cout << endl;
        for (int i = 0; i < n_people; i++) {
            cout << username[i]
                 << ", " << name[i]
                 << ", " << full_name[i]
                 << ", " << email[i]
                 << ", " << institute[i]
                 << ", " << timezone[i] << endl;
        }
    }
    return n_people > 0 ? 0 : 1;
}

int test_check_login(int conn_id, const char *username, const char *password) {
    int password_check_result = check_login(conn_id, username, password);
    return password_check_result;
}

int test_query_components(int conn_id, const char *part, int version) {
    str_table_t status;
    str_table_t location;
    str_table_t description;
    str_table_t serial_number;
    int_table_t id;
    int_table_t parent;
    int n_component;

    query_components(conn_id, part, version, &n_component, id,
                     (char *) status, (char *) description, (char *) serial_number, (char *) location, parent);
    if (VERBOSE) {
        for (int i = 0; i < n_component; i++) {
            cout << id[i]
                 << ", " << status[i]
                 << ", " << description[i]
                 << ", " << serial_number[i]
                 << ", " << location[i]
                 << endl;
        }
    }
    return n_component > 0 ? 0 : 1;
}

int test_insert_component(int conn_id) {
    const char *test_part = "test_part";
    int test_version = 1;
    const char *test_status = "test";
    const char *test_description = "This is a test component";
    const char *test_who = "Mr. Test";
    const char *test_serial_number = "TEST-001";
    const char *test_location = "testsville";

    str_table_t status;
    str_table_t location;
    str_table_t description;
    str_table_t serial_number;
    int_table_t id;
    int_table_t parent;
    int n_component_pre_insert, n_component_post_insert;

    query_components(conn_id, test_part, test_version, &n_component_pre_insert, id,
                     (char *) status, (char *) description, (char *) serial_number, (char *) location, parent);

    insert_component(conn_id, test_part, test_version, test_status, test_description, test_who, test_serial_number,
                     test_location);

    query_components(conn_id, test_part, test_version, &n_component_post_insert, id,
                     (char *) status, (char *) description, (char *) serial_number, (char *) location, parent);

    if (VERBOSE) {
        cout << endl;
        cout << "Components Pre-Insert: " << n_component_pre_insert << endl;
        cout << "Components Post-Insert: " << n_component_post_insert << endl;
    }
    if (n_component_post_insert - n_component_pre_insert == 1) return 0;
    else return 1;
}

int test_remove_component(int conn_id) {
    const char *test_part = "test_part";
    int test_version = 1;
    const char *test_status = "test";
    const char *test_description = "This is a test component";
    const char *test_who = "Mr. Test";
    const char *test_serial_number = "TEST-001";
    const char *test_location = "testsville";

    str_table_t status;
    str_table_t location;
    str_table_t description;
    str_table_t serial_number;
    int_table_t id;
    int_table_t parent;
    int n_component_pre_remove, n_component_post_remove;

    query_components(conn_id, test_part, test_version, &n_component_pre_remove, id,
                     (char *) status, (char *) description, (char *) serial_number, (char *) location, parent);

    int component_id;
    if (n_component_pre_remove == 0) {
        component_id = insert_component(conn_id, test_part, test_version,
                                        test_status, test_description, test_who,
                                        test_serial_number, test_location);
        n_component_pre_remove = 1;

    } else {
        component_id = id[0];
    }
    remove_component(conn_id, component_id);

    query_components(conn_id, test_part, test_version, &n_component_post_remove, id,
                     (char *) status, (char *) description, (char *) serial_number, (char *) location, parent);

    if (VERBOSE) {
        cout << endl;
        cout << "Components Pre-Remove: " << n_component_pre_remove << endl;
        cout << "Components Post-Remove: " << n_component_post_remove << endl;
    }
    if (n_component_post_remove - n_component_pre_remove == -1) return 0;
    else return 1;
}

int test_insert_log(int conn_id) {
    string userid = "test user";
    string remote_ip = "1.2.3.4";
    string type = "test log";

    insert_log(conn_id, userid.c_str(), remote_ip.c_str(), type.c_str());
    return 0;
}

int test_insert_test(int conn_id) {
    insert_test(conn_id, "This is a test test", "dx=5,dy=12,dz=92,t=1h23m,etc,etc", 68, "test");
    return 0;
}

int test_transaction(int conn_id) {
    start_transaction(conn_id);
    return 0;
}

int main(int argc, const char **argv) {
    VERBOSE = false;
    std::cout << "Program Started" << std::endl;
    const char *username = getenv("DB_USERNAME");
    const char *password = getenv("DB_PASSWORD");
    const char *host = getenv("DB_HOST");
    const char *schema = getenv("DB_SCHEMA");
    const char *port = getenv("DB_PORT");
    if (username == nullptr) username = "root";
    if (password == nullptr) password = "password";
    if (host == nullptr) host = "localhost";
    if (schema == nullptr) schema = "cmsfpix_phase2";
    if (port == nullptr) port = "33060";
    int port_ = atoi(port);


    int conn_id = connect(username, password, host, schema, port_);
    if (conn_id < 0) return 0;

//    TEST(test_check_login, conn_id, "amironov", "blueberries");
//    TEST(test_query_components, conn_id, "rd53a_chip", 1);
//    TEST(test_insert_component, conn_id);
//    TEST(test_remove_component, conn_id);
//    TEST(test_update_component, conn_id);
//    TEST(test_insert_log, conn_id);
//
//    TEST(test_query_parts, conn_id);
//    TEST(test_query_people, conn_id);
//    TEST(test_insert_test, conn_id);
    TEST(test_transaction, conn_id);

    disconnect(conn_id);
    return 0;
}
