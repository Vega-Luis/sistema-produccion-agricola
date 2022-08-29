#ifndef CONN_TOOLS_H
#define CONN_TOOLS_H
#include <libpq-fe.h>
#include <stdlib.h>

/**
 * @brief Clear the "res" pointer and ends the connection
 * 
 * @param conn PGconn
 * @param res PGres
 */
void end_conn(PGresult *res,PGconn *conn);

/**
 * @brief Checks the result status
 * 
 * @param conn The PGconn 
 * @param res The PGresult
 */
void check_status(PGresult *res,PGconn *conn);

void check_insert(PGresult *res, PGconn *conn);


#endif