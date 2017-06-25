////////////////////
//Autor: Jakub Pezda
//Program wyświetlający liczby max dla wszystkich typów zmiennopozycyjnych
////////////////////

#include <stdio.h>
#include <float.h>

main()
{
	printf("MAX float: %.8g\n", FLT_MAX);
	printf("MAX double: %.17g\n", DBL_MAX);
	printf("MAX long  double: %.21g\n", LDBL_MAX);
}