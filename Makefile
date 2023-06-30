.PHONY: all clean

CFLAGS ?= -Wall -Wextra -Werror

SRC := $(wildcard *.c)
HEADER := $(wildcard *.h)
OBJ := $(patsubst %.c,%.o,$(SRC))
BINS := c_arena

all: $(BINS)

clean:
	$(RM) $(OBJ) $(BINS)

$(OBJ): $(SRC) $(HEADER)

$(BINS): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(LDLIBS)
