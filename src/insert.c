#include "insert.h"

void insert_area(PGconn *conn, char *code, float dimension, char *principal_prodcut)
{
    uint32_t dimension_binary = htonl((uint32_t)dimension);
    const char *param_values[] = {code, (char *)&dimension_binary, principal_prodcut};
    int param_lengths[] = {sizeof(code), sizeof(dimension_binary), sizeof(principal_prodcut)};
    int param_formats[] = {0, 1, 0 };

    PGresult *res = PQexecParams(conn,
                    "INSERT INTO public.\"Area\"("
                    "code, dimension, \"principalProduct\")"
                    "VALUES ($1, $2::real, $3);",
                    3,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_insert(res, conn);
    PQclear(res);
}

void insert_products(PGconn *conn, char *batch, char *name, float cost, float taxe)
{
    uint32_t cost_binary = htonl((uint32_t)cost);
    uint32_t taxe_binary = htonl((uint32_t)taxe);
    const char *param_values[] = {batch, name, (char *)&cost_binary,
                                  (char *)&taxe_binary};
    int param_lengths[] = {sizeof(batch), sizeof(name), sizeof(cost_binary),
                           sizeof(taxe_binary)};
    int param_formats[] = {0, 0, 1, 1};

    PGresult *res = PQexecParams(conn,
                    "INSERT INTO public.\"Product\"("
                    "batch, name, cost, taxe)"
                    "VALUES ($1, $2, $3::int, $4::int);",
                    4,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_insert(res, conn);
    PQclear(res);
}

void insert_employee(PGconn *conn, char *id_number, char *name, char *position,
                     float salary)
{
    uint32_t salary_binary = htonl((uint32_t)salary);
    const char *param_values[] = {id_number, name, position,
                                  (char *)&salary_binary};
    int param_lengths[] = {sizeof(id_number), sizeof(name), sizeof(position),
                           sizeof(salary_binary)};
    int param_formats[] = {0, 0, 0, 1};

    PGresult *res = PQexecParams(conn,
                    "INSERT INTO public.\"Employee\"("
                    "\"idNumber\", name, \"position\", salary)"
                    "VALUES ($1, $2, $3, $4::real);",
                    4,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_insert(res, conn);
    PQclear(res);
}

int new_payroll(PGconn *conn, int month, int year)
{
    uint32_t month_binary = htonl((uint32_t)month);
    uint32_t year_binary = htonl((uint32_t)year);
    const char *param_values[] = {(char *)&month_binary,(char *)&year_binary};
    int param_lengths[] = {sizeof(month_binary), sizeof(year_binary)};
    int param_formats[] = {1, 1};

    PGresult *res = PQexecParams(conn,
                    "INSERT INTO public.\"Payroll\"("
                    "month, year)"
                    "VALUES ($1::int, $2::int);",
                    2,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_insert(res, conn);
    PQclear(res);
    return 0;
}

void add_employee_to_payroll(PGconn *conn, int id_employee, int id_payroll)

{
    uint32_t id_employee_binary = htonl((uint32_t)id_employee);
    uint32_t id_payroll_binary = htonl((uint32_t)id_payroll);
    const char *param_values[] = {(char *)&id_employee_binary,(char *)&id_payroll_binary};
    int param_lengths[] = {sizeof(id_employee_binary), sizeof(id_payroll_binary)};
    int param_formats[] = {1, 1};

    PGresult *res = PQexecParams(conn,
                    "INSERT INTO public.\"PayrollXEmployee\"("
                    "id_employee, id_payroll)"
                    "VALUES ($1::int, $2::int);",
                    2,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_insert(res, conn);
    PQclear(res);
}

int new_bill(PGconn *conn, int day, int month, int year, char *client_name,
             char *shop_name, char *legal_identity, char *phone_number)
{
    uint32_t day_binary = htonl((uint32_t)day);
    uint32_t month_binary = htonl((uint32_t)month);
    uint32_t year_binary = htonl((uint32_t)year);

    const char *param_values[] = {(char *)&day_binary,(char *)&month_binary,
                    (char *)&year_binary, client_name, shop_name, legal_identity,
                    phone_number};
    int param_lengths[] = {sizeof(day_binary), sizeof(month_binary), sizeof(year_binary),
                    sizeof(client_name), sizeof(shop_name), sizeof(legal_identity),
                    sizeof(phone_number)};
    int param_formats[] = {1, 1, 1, 0, 0, 0, 0};

    PGresult *res = PQexecParams(conn,
                    "INSERT INTO public.\"Bill\"("
                    "day, month, year, client_name, shop_name, legal_identity,"
                    "phone_number)"
                    "VALUES ($1::int, $2::int, $3::int, $4, $5, $6, $7);",
                    7,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_insert(res, conn);
    PQclear(res); 
    return 0;
}

void add_product_to_bill(PGconn *conn, int id_bill, int id_product, int id_area)
{
    uint32_t id_bill_binary = htonl((uint32_t)id_bill);
    uint32_t id_product_binary = htonl((uint32_t)id_product);
    uint32_t id_area_binary = htonl((uint32_t)id_area);
    const char *param_values[] = {(char *)&id_bill_binary,(char *)&id_product_binary,
                    (char *)&id_area_binary};
    int param_lengths[] = {sizeof(id_bill_binary), sizeof(id_product_binary),
                    sizeof(id_area_binary)};
    int param_formats[] = {1, 1, 1};

    PGresult *res = PQexecParams(conn,
                    "INSERT INTO public.\"BillXProduct\"("
                    "fk_id_bill, fk_id_product, fk_id_area)"
                    "VALUES ($1::int, $2::int, $3::int);",
                    3,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_insert(res, conn);
    PQclear(res);
}
