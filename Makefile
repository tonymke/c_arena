.PHONY: all check clean

CFLAGS ?= -g -Og -Wall -Wextra -Werror

SRC = main.c
BIN = c_arena

RM ?= rm -f  # not defined in POSIX make

all: $(BIN)

check: $(BIN)
	./$(BIN) $(CHECKFLAGS)

clean:
	$(RM) $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@ $(LDFLAGS) $(LDLIBS)
