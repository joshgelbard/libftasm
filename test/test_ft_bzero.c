#include "testrunner.h"

void	test_ft_bzero(void)
{
	char *ss[] = {
		"",
		".",
		"..",
		"...................................."
	};
	size_t nelems = (sizeof(ss) / sizeof(*(ss)));
	for (size_t i = 0; i < nelems; i++) {
		size_t sz = strlen(ss[i]) + 1;
		char *s = strdup(ss[i]);
		char *s2 = strdup(ss[i]);
		bzero(s, 0);
		ft_bzero(s2, 0);
		assert(!memcmp(s, s2, sz));
		bzero(s, sz - 1);
		ft_bzero(s2, sz - 1);
		assert(!memcmp(s, s2, sz));
		bzero(s, sz);
		ft_bzero(s2, sz);
		assert(!memcmp(s, s2, sz));
		free(s);
		free(s2);
	}
	printf("%s: ok\n", __func__);
}
