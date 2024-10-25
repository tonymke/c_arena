.PHONY: all check clean

CFLAGS ?= -Og -g -pedantic -std=c99 -Wall -Werror -Wextra -Wfatal-errors \
		  -Wno-error=pedantic -Wno-error=unused-parameter

SRC = $(wildcard *.c)
BIN = arena

RM ?= rm -f  # not defined in POSIX make

all: $(BIN)

check: $(BIN)
	./$(BIN) $(CHECKFLAGS)

clean:
	$(RM) $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@ $(LDFLAGS) $(LDLIBS)
