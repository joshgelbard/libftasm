#include "testrunner.h"

static void test_once(char *s)
{
	size_t sz = strlen(s) + 1;
	char *s1 = strdup(s);
	char *s2 = strdup(s);

	bzero(s1, 0);
	ft_bzero(s2, 0);
	assert(!memcmp(s1, s2, sz));

	bzero(s1, sz - 1);
	ft_bzero(s2, sz - 1);
	assert(!memcmp(s1, s2, sz));

	bzero(s1, sz);
	ft_bzero(s2, sz);
	assert(!memcmp(s1, s2, sz));

	free(s1);
	free(s2);
}

void	test_ft_bzero(void)
{
	test_once("");
	test_once(".");
	test_once("..");
	test_once(".....................");
	char *bigstring = calloc(99999, 1);
	memset(bigstring, '.', 99998);
	test_once(bigstring);
	free(bigstring);
	printf("%s: ok\n", __func__);
}
