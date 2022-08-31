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
 * @brief Checks the DB query result status
 * 
 * @param conn DB connection object
 * @param res DB query result
 */
void check_status(PGresult *res,PGconn *conn);

/**
 * @brief Checks the DBinsert result status
 * 
 * @param res DB insert result
 * @param conn DB connection object
 */
void check_insert(PGresult *res, PGconn *conn);


#endif