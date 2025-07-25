.PHONY: all check clean lint

-include Makefile.local

SRC := $(wildcard *.c)
HEADER := $(wildcard *.h)
OBJ := $(SRC:%.c=%.o)
BIN := arena

all: $(OBJ) $(BIN)

check: $(BIN)
	$(foreach bin,$^,$(CURDIR)/$(bin) $(CHECKFLAGS);)

clean:
	$(RM) $(OBJ) $(BIN)

lint:
	cppcheck --enable=all --inconclusive --language=c --suppress=missingIncludeSystem --quiet $(SRC) $(HEADER)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $^ -o "$@" $(LDFLAGS) $(LDLIBS)
