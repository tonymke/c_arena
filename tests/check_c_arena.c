#ifndef __STRICT_ANSI__
#define __STRICT_ANSI__
#endif /*__STRICT_ANSI__*/

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
