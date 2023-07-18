.PHONY: all check clean

CFLAGS ?= -g -Og -Wall -Wextra -Werror

SRC := $(wildcard *.c)
HEADER := $(wildcard *.h)
OBJ := $(patsubst %.c,%.o,$(SRC))
BIN := c_arena

all: $(BIN)

check: $(BIN)
	$(dir $<)$(notdir $<) $(CHECKFLAGS)

clean:
	$(RM) $(OBJ) $(BIN)

$(OBJ): $(SRC) $(HEADER)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(LDLIBS)
