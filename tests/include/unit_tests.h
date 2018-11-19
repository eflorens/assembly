#ifndef UNIT_TESTS_H_
# define UNIT_TESTS_H_

#include <criterion/criterion.h>
#include <stdio.h>
#include <dlfcn.h>
#include <string.h>

void	*lib;

void	lib_open(void);
void	lib_close(void);

#endif /* UNIT_TESTS_H_ */
