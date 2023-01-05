CFLAGS = -g -Og -std=c99 -Wall -Wextra -Werror -pedantic -pedantic-errors
# LIBS += glib-2.0

ifdef LIBS
CFLAGS += `pkg-config --cflags $(LIBS)`
LDFLAGS += `pkg-config --libs $(LIBS)`
endif

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
