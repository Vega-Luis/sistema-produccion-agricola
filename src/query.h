#ifndef QUERY_H
#define QUERY_H
#include <libpq-fe.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "conn_tools.h"

/**
 * @brief Selects areas from DB
 * 
 * @param conn DB connection object
 */
void query_area(PGconn *conn);
/**
 * @brief Selects employees from DB
 * 
 * @param conn DB connection object
 */
void query_employees(PGconn *conn);
/**
 * @brief Selects payrolls from DB
 * 
 * @param conn DB connection object
 */
void query_payrolls(PGconn *conn);
/**
 * @brief Select payroll info from DB
 * 
 * @param conn DB connection object
 * @param id_payroll Payroll id 
 */
void query_payroll_info(PGconn *conn, int id_payroll);
/**
 * @brief Selects bills from DB
 * 
 * @param conn DB connection object
 */
void query_bills(PGconn *conn);
/**
 * @brief Selects bill info from DB 
 * 
 * @param conn DB connection object
 * @param id_bill Bill id
 */
void query_bill_info(PGconn *conn, int id_bill);
/**
 * @brief Selects payroll simple info from DB
 * 
 * @param conn DB connection object
 */
void query_payroll_simple(PGconn *conn);
/**
 * @brief Selects products from DB
 * 
 * @param conn DB connection object
 */
void query_products(PGconn *conn);
/**
 * @brief Selects bills simple info from DB
 * 
 * @param conn DB connection object
 */
void query_bills_simple(PGconn *conn);
/**
 * @brief Makes balance query from DB
 * 
 * @param conn DB connection object
 */
void query_balance(PGconn * conn);
#endif