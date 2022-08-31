#ifndef NAV_H
#define NAV_H
#include <stdio.h>
#include <stdbool.h>
#include "query.h"
#include "insert.h"
#include "ui.h"
#include <libpq-fe.h>
void wait();
bool check_credentials();
void ope_opts_nav(PGconn * conn);
void adm_opts_nav(PGconn * conn);
void main_menu_nav(PGconn *conn);
void reg_payroll(PGconn *conn);
void cons_payroll(PGconn *conn);
void cons_bills(PGconn *conn);
void load_products(PGconn *conn);
void reg_bill(PGconn *conn, char * shop_name, char *legal_identity, char *phone_number);
#endif