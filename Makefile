CFLAGS = -g -Og -std=c99 -Wall -Wextra -Werror -pedantic -pedantic-errors
# LIBS += glib-2.0

ifdef LIBS
CFLAGS += `pkg-config --cflags $(LIBS)`
LDFLAGS += `pkg-config --libs $(LIBS)`
endif

VALGRINDFLAGS += --error-exitcode=255 --tool=memcheck --leak-check=full

.PHONY: all check clean valgrind

BINS := c_arena
SRC := c_arena.c
OBJS := $(patsubst %.c,%.o,$(filter *.c,$(SRC)))

all: $(BINS)

clean:
	rm -f $(BINS) $(OBJS)
	rm -rf $(patsubst %,%.dSYM,$(BINS))

check: $(BINS)
	$(foreach bin, $(BINS), ./$(bin);)

valgrind: $(BINS)
	$(foreach bin, $(BINS), valgrind $(VALGRINDFLAGS) ./$(bin);)

c_arena: $(OBJS)
