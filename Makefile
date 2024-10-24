.PHONY: all check clean

CFLAGS ?= -std=c99 -g -Og -Wall -Wextra -Werror -Wfatal-errors -pedantic \
		  -pedantic-errors

SRC = main.c
BIN = arena

RM ?= rm -f  # not defined in POSIX make

all: $(BIN)

check: $(BIN)
	./$(BIN) $(CHECKFLAGS)

clean:
	$(RM) $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@ $(LDFLAGS) $(LDLIBS)
