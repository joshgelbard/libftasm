#include "testrunner.h"

void test_ft_puts(void)
{
	ft_puts("hello there");
	ft_puts(NULL);
	printf("%s: ok\n", __func__);
}
