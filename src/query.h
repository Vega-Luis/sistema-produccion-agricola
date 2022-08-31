#ifndef QUERY_H
#define QUERY_H
#include <libpq-fe.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "conn_tools.h"

void query_area(PGconn *conn);
void query_employees(PGconn *conn);
void query_payrolls(PGconn *conn);
void query_payroll_info(PGconn *conn, int id_payroll);
void query_bills(PGconn *conn);
void query_bill_info(PGconn *conn, int id_bill);
void query_payroll_simple(PGconn *conn);
void query_products(PGconn *conn);
void query_bills_simple(PGconn *conn);
void query_balance(PGconn * conn);
#endif