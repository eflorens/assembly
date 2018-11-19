#include "unit_tests.h"

Test(asm_minilibc, memset_full_str, .init=lib_open, .fini=lib_close)
{
	char str[5] = "cacao";
	void *(*my_memset)(void *, int, size_t) = dlsym(lib, "memset");

	if (my_memset == NULL)
		exit(84);
	my_memset(str, '$', 5);
	cr_assert(strcmp(str, "$$$$$") == 0);
}

Test(asm_minilibc, memset_nothing, .init=lib_open, .fini=lib_close)
{
	char str[5] = "cacao";
	void *(*my_memset)(void *, int, size_t) = dlsym(lib, "memset");

	if (my_memset == NULL)
		exit(84);
	my_memset(str, '$', 0);
	cr_assert(strcmp(str, "cacao") == 0);
}