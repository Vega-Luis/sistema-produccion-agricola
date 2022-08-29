#!/bin/bash

rm main
clear
gcc -Wall -I "$(pg_config --includedir)" -L "$(pg_config --libdir)" -o main connection.c query.c query.h conn_tools.c conn_tools.h insert.h insert.c -lpq


./main "host=localhost dbname=sistema-produccion-agricola user=postgres password=password"
