#ifndef NAV_H
#define NAV_H
#include <stdio.h>
#include <stdbool.h>
#include "query.h"
#include "insert.h"
#include "ui.h"
#include <libpq-fe.h>
/**
 * @brief Makes the prgram wait for a enter keystroke
 * 
 */
void wait();
bool check_credentials();
/**
 * @brief Shows the Operative options menu
 * 
 * @param conn DB connection object
 */
void ope_opts_nav(PGconn * conn);
/**
 * @brief Shows the admistrative options menu 
 * 
 * @param conn DB connection object
 */
void adm_opts_nav(PGconn * conn);
/**
 * @brief Shows the main menu
 * 
 * @param conn DB connection object
 */
void main_menu_nav(PGconn *conn);
/**
 * @brief Show payroll menu
 * 
 * @param conn DB connection object
 */
void reg_payroll(PGconn *conn);
/**
 * @brief Show query payroll menu
 * 
 * @param conn DB connection object
 */
void cons_payroll(PGconn *conn);
/**
 * @brief Shows query bill menu
 * 
 * @param conn DB connection object
 */
void cons_bills(PGconn *conn);
/**
 * @brief Shows load product interaction
 * 
 * @param conn DB connection object
 */
void load_products(PGconn *conn);
/**
 * @brief Manges bill registration behavior
 * 
 * @param conn DB connection object
 * @param shop_name Bill shop name
 * @param legal_identity Bill legal identity
 * @param phone_number Bill phone number
 */
void reg_bill(PGconn *conn, char * shop_name, char *legal_identity, char *phone_number);
#endif