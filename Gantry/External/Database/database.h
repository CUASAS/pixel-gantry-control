#ifndef CLIONLVTEST_DATABASE_H
#define CLIONLVTEST_DATABASE_H

#define DLLExport __declspec(dllexport)

#define DB_STR_LEN 128
#define DB_ARR_LEN 1024

typedef char str_table_t[DB_ARR_LEN][DB_STR_LEN];
typedef int int_table_t[DB_ARR_LEN];
typedef float float_table_t[DB_ARR_LEN];

extern "C" {

DLLExport int
__cdecl connect(const char *username, const char *password, const char *url, const char *schema, int port);
DLLExport int __cdecl disconnect(int conn_id);
DLLExport int __cdecl start_transaction(int conn_id);
DLLExport int __cdecl rollback_transaction(int conn_id);
DLLExport int __cdecl finish_transaction(int conn_id);
DLLExport int __cdecl max_string_length() { return DB_STR_LEN; } ;
DLLExport int __cdecl max_array_length() { return DB_ARR_LEN; } ;
DLLExport int __cdecl query_parts(int conn_id, int *n_parts, char *part, int *version,
                                  char *description, char *prefix, float *dim_x, float *dim_y, float *dim_z,
                                  char *type);
DLLExport int __cdecl query_people(int conn_id, int *n_people, char *username, char *name,
                                   char *full_name, char *email, char *institute, char *timezone);
DLLExport int __cdecl check_login(int conn_id, const char *username, const char *password);
DLLExport int
__cdecl query_components(int conn_id, const char *part, int version, int *n_component, int *id, char *status,
                         char *description, char *serial_number, char *location, int *parent);
DLLExport int __cdecl insert_component(int conn_id, const char *part, int version, const char *status,
                                       const char *description, const char *who, const char *serial_number,
                                       const char *location);
DLLExport int __cdecl update_component(int conn_id, int id, const char *status, int parent);
DLLExport int __cdecl remove_component(int conn_id, int component_id);
DLLExport int __cdecl insert_log(int conn_id, const char *userid, const char *remote_ip, const char *type);
DLLExport int __cdecl insert_test(int conn_id, const char *description, const char *data, int component_id,
                                  const char *type);
}

#endif //CLIONLVTEST_DATABASE_H