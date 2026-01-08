#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	if (puts("Hello world") == EOF) {
		perror("puts");
		exit(EXIT_FAILURE);
	}
	return EXIT_SUCCESS;
}
