#include "ui.h"
void menu_line()
{
    printf("===========================================\n");
}

void main_menu(){
    menu_line();
    printf("|            MENU PRINCIPAL               |\n");
    menu_line();
    printf("|       1. Opciones Operativas            |\n");
    printf("|       2. Opciones Administrativas       |\n");
    printf("|       3. Salir                          |\n");
    menu_line();
    printf("    Selecione una opcion: ");

}
void ope_opts()
{
    menu_line();
    printf("|           OPCIONES OPERATIVAS           |\n");
    menu_line();
    printf("|       1. Carga de Productos             |\n");
    printf("|       2. Lista de Areas                 |\n");
    printf("|       3. Lista de Empleados             |\n");
    printf("|       4. Volver                         |\n");
    menu_line();
    printf("    Selecione una opcion: ");
}

void adm_opts()
{
    menu_line();
    printf("|        OPCIONES ADMINISTRATIVAS         |\n");
    menu_line();
    printf("|       1. Valores Iniciales              |\n");
    printf("|       2. Registro de Nomina             |\n");
    printf("|       3. Registro de Venta de Productos |\n");
    printf("|       4. Consulta de Nominas            |\n");
    printf("|       5. Consulta de Ventas             |\n");
    printf("|       6. Balance Anual                  |\n");
    printf("|       7. Volver                         |\n");
    menu_line();
    printf("    Selecione una opcion: ");
}