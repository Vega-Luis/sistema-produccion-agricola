#ifndef QUERY_H
#define QUERY_H
void check(PGresult *res, PGconn *conn);
void query_area(PGconn *conn);
void query_employees(PGconn *conn);
#endif