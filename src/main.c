#ifdef HAVE_CONFIG_H
#include <config.h>
#endif /* #ifdef HAVE_CONFIG_H */

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	if (puts("Hello from " PACKAGE_STRING "!") == EOF) {
		perror("puts");
		exit(EXIT_FAILURE);
	}
	return EXIT_SUCCESS;
}
