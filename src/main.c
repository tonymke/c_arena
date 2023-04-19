#ifndef _ISOC99_SOURCE
#define _ISOC99_SOURCE
#endif  /* _ISOC99_SOURCE */

#include <stdlib.h>

#include "c_arena.h"

int
main (void)
{
	return c_arena() ? EXIT_SUCCESS : EXIT_FAILURE;
}
