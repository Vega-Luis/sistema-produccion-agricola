#include <libpq-fe.h>
#include <stdlib.h>

void check_status(PGresult *res, PGconn *conn)
{
    if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
        printf("No data retrieved\n");
        PQclear(res);
        fprintf(stderr, "%s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }
}

void query_area(PGconn *conn)
{
    PGresult *res = PQexec(conn, "SELECT code, dimension, \"principalProduct\" FROM public.\"Area\";");
    check_status(res, conn);

    char const *params = "  %-7s|  %-12s | %-30s | %-10s\n";
    printf("\n");
	printf(params, "CODE", "DIMENSION", "PRINCIPAL PRODUCT");
	printf("==================================================================\n");
    
    int rows = PQntuples(res);
    
    for(int i=0; i<rows; i++) {
        printf(params,  PQgetvalue(res, i, 1),
                        PQgetvalue(res, i, 2),PQgetvalue(res, i, 3));
    }
    PQclear(res);
    PQfinish(conn);
}

void query_employees(PGconn * conn)
{
    PGresult *res = PQexec(conn, "SELECT id, \"idNumber\", name, \"position\", salary	FROM public.\"Employee\";");
    check_status(res, conn);

    int rows = PQntuples(res);

	char const *params = "  %-7s|  %-12s | %-30s | %-10s| %s\n";
    printf("\n");
	printf(params, "INDEX", "ID NUMBER", "NAME", "POSITION", "SALARY");
	printf("=======================================================================================\n");
    
    for(int i=0; i<rows; i++) {
        printf(params, PQgetvalue(res, i, 0), PQgetvalue(res, i, 1),
                        PQgetvalue(res, i, 2),PQgetvalue(res, i, 3),
                        PQgetvalue(res, i, 4));
    }
    PQclear(res);
    PQfinish(conn);
}
