#include "insert.h"

void insert_products(PGconn *conn, char *batch, char *name, float cost, float taxe) {
    PGresult *res = PQexec(conn, "INSERT INTO public.\"Employee\"(\"idNumber\", name,\"position\", salary) VALUES ('1111', 'ruperto', 'Jefe', 50708000.0);")
    check_status(conn, res);
    end_conn(res, conn);
}

void insert_employee(PGcon *conn, char *id_number, char *name, char *position,
                float salary) {

                }

int new_payroll(PGconn *conn, int month, int year) {

}
void add_employee_to_payroll(PGconn *conn, int id_employee, int id_payroll) {

}

int new_bill(PGconn *conn, int day, int month, int year, char *client_name,
                char *shop_name, char *legal_identity, char *phone_number) {

                }
void add_product_to_bill(PGconn *conn, int id_bill, int id_product, int id_area) {
    
}
