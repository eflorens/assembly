#include "unit_tests.h"

Test(asm_minilibc, memcpy_full_str, .init=lib_open, .fini=lib_close)
{
	char src[30] = "aqwzsxedcrfvtgbyhnujikolpmaqwz";
	char dest[30];
	void *(*mmemcpy)(void *, const void *, size_t) = dlsym(lib, "memcpy");

	if (mmemcpy == NULL)
		exit(84);
	mmemcpy(dest, src, 30);
	cr_assert(strcmp(dest, src) == 0);
}

Test(asm_minilibc, memcpy_nothing, .init=lib_open, .fini=lib_close)
{
	char src[30] = "aqwzsxedcrfvtgbyhnujikolpmaqwz";
	char dest[30];
	void *(*mmemcpy)(void *, const void *, size_t) = dlsym(lib, "memcpy");

	if (mmemcpy == NULL)
		exit(84);
	memset(dest, 0, 30);
	mmemcpy(dest, src, 0);
	cr_assert(strcmp(dest, "") == 0);
}

Test(asm_minilibc, memcpy_part_str, .init=lib_open, .fini=lib_close)
{
	char src[30] = "aqwzsxedcrfvtgbyhnujikolpmaqwz";
	char dest[30];
	void *(*mmemcpy)(void *, const void *, size_t) = dlsym(lib, "memcpy");

	if (mmemcpy == NULL)
		exit(84);
	memset(dest, 0, 30);
	mmemcpy(dest, src, 10);
	cr_assert(strcmp(dest, "aqwzsxedcr") == 0);
}
