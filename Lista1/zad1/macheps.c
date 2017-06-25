////////////////////
//Autor: Jakub Pezda
//Program wyświetlający epsilon maszynowy dla wszystkich typów zmiennopozycyjnych
////////////////////

#include <float.h>
#include <stdio.h>

main()
{
	printf("float macheps: %.9g\n", FLT_EPSILON);
	printf("double macheps: %.17g\n", DBL_EPSILON);
	printf("long double macheps: %.21g\n", LDBL_EPSILON);
}