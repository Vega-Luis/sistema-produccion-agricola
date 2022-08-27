#include "conn_tools.h"

void end_conn(PGresult *res, PGconn *conn) {
    PQclear(res);
    PQfinish(conn);
}

void check_status(PGresult *res, PGconn *conn)
{
    if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
        printf("No data retrieved\n");
        fprintf(stderr, "%s\n", PQerrorMessage(conn));
        end_conn(res, conn);
        exit(1);
    }
}