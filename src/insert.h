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
/**
 * @brief Insert data into the DB Area table
 * 
 * @param conn BD connection object
 * @param code Area code
 * @param dimension Area dimension
 * @param principal_product Area principal product
 */
void insert_area(PGconn *conn, char *code, float dimension, char *principal_product);
/**
 * @brief Insert data into the DB Product table
 * 
 * @param conn DB connection object
 * @param batch Product batch
 * @param name Product name
 * @param cost Product cost
 * @param taxe Product taxe
 */
void insert_products(PGconn *conn, char *batch, char *name, float cost, float taxe);
/**
 * @brief Insert data into the DB Employee table
 * 
 * @param conn DB connection object
 * @param id_number Employee id number
 * @param name Employee name
 * @param position Employee position
 * @param salary Employee salary
 */
void insert_employee(PGconn *conn, char *id_number, char *name, char *position,
                float salary);
/**
 * @brief Creates a new payroll
 * 
 * @param conn DB connection object
 * @param month Payroll month
 * @param year Payroll year
 */
void new_payroll(PGconn *conn, int month, int year);
/**
 * @brief Add a new employee to Payroll
 * 
 * @param conn DB connection Object
 * @param id_employee Employee table id
 * @param id_payroll Payroll table id
 */
void add_employee_to_payroll(PGconn *conn, int id_employee, int id_payroll);
/**
 * @brief Creates a new bill register into Bill table
 * 
 * @param conn DB connection object
 * @param day Bill day
 * @param month Bill month
 * @param year Bill year
 * @param client_name Bill client name
 * @param shop_name Bill shop name
 * @param legal_identity Bill legal identity
 * @param phone_number Bill phone number
 */
void new_bill(PGconn *conn, int day, int month, int year, char *client_name,
                char *shop_name, char *legal_identity, char *phone_number);
/**
 * @brief Adds product to Bill
 * 
 * @param conn DB connection object
 * @param id_bill Bill table id
 * @param id_product Product table id
 * @param id_area Area table id
 */
void add_product_to_bill(PGconn *conn, int id_bill, int id_product, int id_area);

#endif