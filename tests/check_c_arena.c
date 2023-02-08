#ifndef _ISOC99_SOURCE
#define _ISOC99_SOURCE
#endif  /* _ISOC99_SOURCE */

#ifdef NDEBUG
#error "NDEBUG cannot be on"
#endif /* NDEBUG */

#include <assert.h>
#include <stdlib.h>

#include "c_arena.h"

int
main (void)
{
	assert(c_arena());

	return EXIT_SUCCESS;
}
