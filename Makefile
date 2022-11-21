CFLAGS = -g -Og -std=c99 -Wall -Wextra -Werror -pedantic -pedantic-errors
# CFLAGS += `pkg-config --cflags glib-2.0`

# LDFLAGS += `pkg-config --libs glib-2.0`

.PHONY: all check clean

BINS := c_arena
SRC := c_arena.c
OBJS := $(patsubst %.c,%.o,$(filter *.c,$(SRC)))

all: $(BINS)

clean:
	rm -f $(BINS) $(OBJS)
	rm -rf $(patsubst %,%.dSYM,$(BINS))

check: $(BINS)
	./c_arena

c_arena: $(OBJS)
