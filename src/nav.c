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
	//system("clear");
	ope_opts();
	scanf(" %c", &opt);
	switch (opt)
	{
	case '1': 
		break;

	case '2':
		//system("clear");
		query_area(conn);
		wait();	
		break;

	case '3':
		//system("clear");
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
    //system("clear");
    scanf(" %c", &opt);
    switch (opt)
    {
    case '1':
        
        break;
    
    case '2':
        break;

    case '3':
        break;

    case 4:
        break;
    
    case 5:
        break;
    
    case 6:
        break;

    case 7:
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
				//system("clear");
				ope_opts_nav(conn);
			} else {
				printf("	Credenciales invalidos");
			}
			break;
		
		case '2':
			//system("clear");
			adm_opts();
			scanf(" %c", &opt);
			printf("You choosed: %c\n", opt);
			break;

		case '3':
			exit = true;
			break;

		default:
			break;
		}
	} while (!exit);
}