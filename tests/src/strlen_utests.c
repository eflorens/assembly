#include "unit_tests.h"

Test(asm_minilibc, strlen_empty, .init=lib_open, .fini=lib_close)
{
	int (*my_strlen)(char *) = dlsym(lib, "strlen");

	if (my_strlen == NULL)
		exit(84);
	cr_assert_eq(my_strlen(""), 0);
}

Test(asm_minilibc, strlen_str, .init=lib_open, .fini=lib_close)
{
	int (*my_strlen)(char *) = dlsym(lib, "strlen");

	if (my_strlen == NULL)
		exit(84);
	cr_assert_eq(my_strlen("pouet"), 5);
}
