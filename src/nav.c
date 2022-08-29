#include "nav.h"

void wait() {
	printf("\nPresione enter para continuar...\n");
	getchar();
	getchar();
}

bool check_credentials() {
	//system("clear");
	char user[16];
	char password[16];
	printf("\n	Ingrese su usuario: ");
	scanf(" %s", user);
	printf("	Ingrese su contrasenia: ");
	scanf(" %s", password);

	return true;
}

void ope_opts_nav(PGconn *conn) {
	bool go_back = false;
	char opt;
	do {
	system("clear");
	ope_opts();
	scanf(" %c", &opt);
	switch (opt)
	{
	case '1': 
		break;

	case '2':
		system("clear");
		query_area(conn);
		wait();	
		break;

	case '3':
		system("clear");
		query_employees(conn);
		wait();
		break;

	case '4':
		go_back = true;
		break;

	default:
		break;
	}
	} while (!go_back);
}

void adm_opts_nav(PGconn *conn) {
    bool go_back = false;
    char opt;
    do {
    system("clear");
	adm_opts();
    scanf(" %c", &opt);
    switch (opt)
    {
    case '1':
        
        break;
    
    case '2':
		reg_payroll(conn);
        break;

    case '3':
        break;

    case '4':
		cons_payroll(conn);
        break;
    
    case '5':
		cons_bills(conn);
        break;
    
    case '6':
        break;

    case '7':
        go_back = true;
        break;

    default:
        break;
    }

    } while (!go_back);
}
void main_menu_nav(PGconn *conn) {
    bool exit = false;
	char opt;
	do{
		//system("clear");
		main_menu();
		scanf(" %c", &opt);
		switch (opt)
		{
		case '1':
			if (check_credentials()) {
				ope_opts_nav(conn);
			} else {
				printf("	Credenciales invalidos");
			}
			break;
		
		case '2':
			adm_opts_nav(conn);
			break;

		case '3':
			exit = true;
			break;

		default:
			break;
		}
	} while (!exit);
}

void reg_payroll(PGconn *conn)
{
	int id_payroll, id_employee;
	int month, year;
	bool go_back = false;
	char opt;

	do {
		system("clear");
		payroll_opts();
		scanf(" %c", &opt);

		switch (opt)
		{
		case '1':
			system("clear");
			menu_line();
			printf("|    	        CREAR NOMINA              |\n");
			menu_line();
			printf("	Ingrese el mes de la nomina: ");
			scanf("%d", &month);
			printf("	Ingrese el anio de la nomina: ");
			scanf("%d", &year);
			new_payroll(conn, month, year);
			query_payroll_simple(conn);
			wait();
			break;
		
		case '2':
			system("clear");
			menu_line();
			printf("|        AGREGAR EMPLEADO A NOMINA        |\n");
			menu_line();
			query_employees(conn);
			query_payroll_simple(conn);
			printf("\n	Ingrese el id de la nomina: ");
			scanf("%d", &id_payroll);
			printf("\n	Ingrese el id del empleado: ");
			scanf("%d", &id_employee);
			add_employee_to_payroll(conn, id_employee, id_payroll);
			query_payroll_info(conn, id_payroll);
			wait();
			break;

		case '3':
			go_back = true;
			break;

		default:
			break;
		}
	} while (!go_back);
}

void cons_payroll(PGconn * conn)
{
	char stay;
	int id_payroll;
	do {
		system("clear");
		query_payrolls(conn);
		printf("\n	Ingrese el id de nomina para ver detalles: ");
		scanf("%d", &id_payroll);
		system("clear");
		query_payroll_info(conn, id_payroll);
		printf("\n	Desea consultar otra nomina S/N ");
		scanf(" %c", &stay); 
	} while (stay == 's' || stay == 'S');
}

void cons_bills(PGconn *conn)
{
	char stay;
	int id_bill;
	do {
		system("clear");
		query_bills(conn);
		printf("\n	Ingrese el id de factura para ver detalles: ");
		scanf("%d", &id_bill);
		system("clear");
		query_bill_info(conn, id_bill);
		printf("\n	Desea consultar otra factura S/N ");
		scanf(" %c", &stay); 
	} while (stay == 's' || stay == 'S');	
}

