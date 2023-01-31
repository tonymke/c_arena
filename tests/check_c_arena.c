#ifdef NDEBUG
#error "NDEBUG cannot be on"
#endif /* NDEBUG */

#include <assert.h>
#include <stdlib.h>

#include <config.h>
#include "c_arena.h"

int
main (void)
{
	assert(c_arena());

	return EXIT_SUCCESS;
}
