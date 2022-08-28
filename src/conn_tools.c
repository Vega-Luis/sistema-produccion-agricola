#include "conn_tools.h"

void end_conn(PGresult *res, PGconn *conn) {
    PQclear(res);
    PQfinish(conn);
}

void check_status(PGresult *res, PGconn *conn)
{
    if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
        fprintf(stderr, " Failed: %s", PQerrorMessage(conn));
        end_conn(res, conn);
        exit(1);
    }
}

void check_insert(PGresult *res, PGconn *conn) {
    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
		fprintf(stderr, "Insertion error: %s",PQerrorMessage(conn));
		PQfinish(conn);
		exit(1);
	}
}