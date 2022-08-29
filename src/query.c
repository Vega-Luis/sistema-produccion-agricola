#include "query.h"

void query_area(PGconn *conn)
{
    PGresult *res = PQexec(conn, "SELECT id, code, dimension, \"principalProduct\""
                    "FROM public.\"Area\";");
    check_status(res, conn);

    char const *params = "  %-7s|  %-7s|  %-12s | %-30s\n";
    printf("\n");
    printf(params, "INDEX", "CODE", "DIMENSION", "PRINCIPAL PRODUCT");
    printf("==================================================================\n");

    int rows = PQntuples(res);

    for (int i = 0; i < rows; i++)
    {
        printf(params, PQgetvalue(res, i, 0),
               PQgetvalue(res, i, 1), PQgetvalue(res, i, 2), PQgetvalue(res, i, 3));
    }
    PQclear(res);
}

void query_employees(PGconn *conn)
{
    PGresult *res = PQexec(conn, "SELECT id, \"idNumber\", name, \"position\", salary"
                    " FROM public.\"Employee\";");
    check_status(res, conn);

    int rows = PQntuples(res);

    char const *params = "  %-7s|  %-12s | %-30s | %-10s| %s\n";
    printf("\n");
    printf(params, "INDEX", "ID NUMBER", "NAME", "POSITION", "SALARY");
    printf("=======================================================================================\n");

    for (int i = 0; i < rows; i++)
    {
        printf(params, PQgetvalue(res, i, 0), PQgetvalue(res, i, 1),
               PQgetvalue(res, i, 2), PQgetvalue(res, i, 3),
               PQgetvalue(res, i, 4));
    }
    PQclear(res);
}

void query_payrolls(PGconn *conn)
{
    PGresult *res = PQexec(conn, "SELECT \"Payroll\".id, month, year, SUM(salary) AS subTotal, SUM(salary) * 1.5"
                " FROM public.\"Payroll\""
                " INNER JOIN public.\"PayrollXEmployee\""
                " ON \"Payroll\".id = \"PayrollXEmployee\".id_payroll"
                " INNER JOIN public.\"Employee\""
                " ON \"Employee\".id = \"PayrollXEmployee\".id_employee"
                " GROUP BY \"Payroll\".id, month, year;");
    check_status(res, conn);

    int rows = PQntuples(res);

    char const *params = "  %-7s|  %-7s| %-7s|  %-10s|  %-7s\n";
    printf("\n");
    printf(params, "INDEX", "MONTH", "YEAR", "SUBTOTAL", "TOTAL");
    printf("=======================================================================================\n");

    for (int i = 0; i < rows; i++)
    {
        printf(params, PQgetvalue(res, i, 0), PQgetvalue(res, i, 1),
               PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4));
    }
    PQclear(res);
}

void query_payroll_info(PGconn *conn, int id_payroll)
{
    uint32_t id_payroll_binary = htonl((uint32_t)id_payroll);
    const char *param_values[] = {(char *)&id_payroll_binary};
    int param_lengths[] = {sizeof(id_payroll_binary)};
    int param_formats[] = {1};

    PGresult *res = PQexecParams(conn,
                    "SELECT \"idNumber\", name, position, salary"
                    " FROM public.\"Employee\""
                    " INNER JOIN public.\"PayrollXEmployee\""
                    " ON \"PayrollXEmployee\".id_employee = \"Employee\".id"
                    " WHERE \"PayrollXEmployee\".id_payroll = $1::int;",
                    1,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_status(res, conn);

    int rows = PQntuples(res);

    char const *params = "  %-12s | %-30s | %-10s| %s\n";
    printf("\n");
    printf(params, "ID NUMBER", "NAME", "POSITION", "SALARY");
    printf("=======================================================================================\n");

    for (int i = 0; i < rows; i++)
    {
        printf(params, PQgetvalue(res, i, 0), PQgetvalue(res, i, 1),
               PQgetvalue(res, i, 2), PQgetvalue(res, i, 3));
    }
    PQclear(res);
}
void query_bills(PGconn *conn)
{
    PGresult *res = PQexec(conn, "SELECT \"Bill\".id, day, month, year, SUM (cost)"
	                " FROM public.\"Bill\""
	                " INNER JOIN public.\"BillXProduct\""
	                " ON \"BillXProduct\".fk_id_bill = \"Bill\".id"
	                " INNER JOIN public.\"Product\""
	                " ON \"Product\".id = \"BillXProduct\".fk_id_product"
	                " GROUP BY \"Bill\".id, day, month, year;");
    check_status(res, conn);

    int rows = PQntuples(res);

    char const *params = "  %-7s|  %-7s|  %-7s| %-7s|  %-10s\n";
    printf("\n");
    printf(params, "INDEX", "DAY", "MONTH", "YEAR", "SUBTOTAL");
    printf("=======================================================================================\n");

    for (int i = 0; i < rows; i++)
    {
        printf(params, PQgetvalue(res, i, 0), PQgetvalue(res, i, 1),
               PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4));
    }
    PQclear(res);    
}

void query_bill_info(PGconn *conn, int id_bill)
{
    uint32_t id_bill_binary = htonl((uint32_t)id_bill);
    const char *param_values[] = {(char *)&id_bill_binary};
    int param_lengths[] = {sizeof(id_bill_binary)};
    int param_formats[] = {1};

    PGresult *res = PQexecParams(conn,
                    "SELECT id, day, month, year, client_name, shop_name, legal_identity, phone_number"
	                " FROM public.\"Bill\""
	                " WHERE id = $1::int;",
                    1,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_status(res, conn);

    int rows = PQntuples(res);

    char const *params = "  %-12s | %-7s | %-7s| %-7s|  %-30s  |%-10s  %-12s|  %-10s\n";
    printf("\n");
    printf(params, "ID", "DAY", "MONTH", "YEAR", "CLIENT", "SHOP", "LEGAL ID", "PHONE NUMBER");
    printf("=======================================================================================\n");

    for (int i = 0; i < rows; i++)
    {
        printf(params, PQgetvalue(res, i, 0), PQgetvalue(res, i, 1),
               PQgetvalue(res, i, 2), PQgetvalue(res, i, 3), PQgetvalue(res, i, 4),
               PQgetvalue(res, i, 5), PQgetvalue(res, i, 6), PQgetvalue(res, i, 7));
    }
    PQclear(res);

        res = PQexecParams(conn,
                    "SELECT \"Product\".batch, name, cost, taxe"
	                " FROM public.\"Product\""
	                " INNER JOIN public.\"BillXProduct\""
	                " ON \"BillXProduct\".fk_id_product = \"Product\".id"
	                " WHERE \"BillXProduct\".fk_id_bill = $1::int;",
                    1,
                    NULL,
                    param_values,
                    param_lengths,
                    param_formats,
                    0);
    check_status(res, conn);

    rows = PQntuples(res);

    params = "  %-12s | %-10s | %-10s| %-10s\n";
    printf("\n");
    printf(params, "BATCH", "NAME", "COST", "TAXE");
    printf("=======================================================================================\n");

    for (int i = 0; i < rows; i++)
    {
        printf(params, PQgetvalue(res, i, 0), PQgetvalue(res, i, 1),
               PQgetvalue(res, i, 2), PQgetvalue(res, i, 3));
    }
    PQclear(res);
}
void query_anual_balance(PGconn *conn)
{

}