#include "testrunner.h"

static char *manydots;

static void test_once(size_t len)
{
	char *s = calloc(len + 1, 1);
	char *s2 = calloc(len + 1, 1);
	memcpy(s, manydots, len);
	char *res = ft_memcpy(s2, manydots, len);
	assert(res == s2);
	assert(!strcmp(s, s2));
	free(s);
	free(s2);
}

void	test_ft_memcpy(void)
{
	manydots = calloc(999999, 1);
	memset(manydots, '.', 999998);

	test_once(0);
	test_once(1);
	test_once(10);
	test_once(1024);
	test_once(999998);

	printf("%s: ok\n", __func__);
}
