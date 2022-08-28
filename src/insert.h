#ifndef INSERT_H
#define INSERT_H
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <stdint.h>
#include <string.h>
#include <libpq-fe.h>

#include <netinet/in.h>
#include <arpa/inet.h>
#include "conn_tools.h"

void insert_area(PGconn *conn, char *code, float dimension, char *principal_product);
void insert_products(PGconn *conn, char *batch, char *name, float cost, float taxe);
void insert_employee(PGconn *conn, char *id_number, char *name, char *position,
                float salary);
int new_payroll(PGconn *conn, int month, int year);
void add_employee_to_payroll(PGconn *conn, int id_employee, int id_payroll);
int new_bill(PGconn *conn, int day, int month, int year, char *client_name,
                char *shop_name, char *legal_identity, char *phone_number);
void add_product_to_bill(PGconn *conn, int id_bill, int id_product, int id_area);

#endif