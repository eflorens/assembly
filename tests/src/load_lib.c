#include "unit_tests.h"

void	lib_open(void)
{
	lib = dlopen("./libasm.so", RTLD_LAZY);
	if (lib == NULL) {
		fprintf(stderr, "ERROR: Could not open library !\n");
		exit(84);
	}
}

void	lib_close(void)
{
	int	rval;

	rval = dlclose(lib);
	if (rval != 0) {
		fprintf(stderr, "ERROR: Failed to close library !\n");
		exit(84);
	}
}
