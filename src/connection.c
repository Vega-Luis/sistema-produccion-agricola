#include <stdio.h>
#include <stdlib.h>
#include <libpq-fe.h>
#include "query.h"
#include "conn_tools.h"
#include "insert.h"

static void exit_nicely(PGconn *conn)
{
	PQfinish(conn);
	exit(1);
}

int main(int argc, char **argv)
{
	const char *conninfo;
	PGconn *conn;
	
	/*
	 * The configuration string must be provide as a parameter on the command 
	 * line
	 */
	if (argc > 1)
		conninfo = argv[1];
	else
		conninfo = "dbname=postgres";

	/* Make a connection to the database */
	conn = PQconnectdb(conninfo);

	/* Check to se that the backend connection was succesfully made */
	if (PQstatus(conn) != CONNECTION_OK)
	{
		fprintf(stderr, "Connection failed: %s", PQerrorMessage(conn));
		exit_nicely(conn);
	}

	printf("\n=======================Conection successful=======================\n" );
	
	query_employees(conn);
	query_area(conn);
	query_payrolls(conn);
	query_payroll_info(conn, 16);
	query_bills(conn);
	query_bill_info(conn, 11);

	PQfinish(conn);

return 0;
}
