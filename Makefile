.PHONY: all check clean lint

CFLAGS ?= -Og -g -pedantic -Wall -Werror -Wextra -Wfatal-errors \
		  -Wno-error=pedantic -Wno-error=unused-parameter

PKG_CONFIG_LIBS ?=
CFLAGS += $(if $(PKG_CONFIG_LIBS), \
		  $(shell pkg-config --cflags $(PKG_CONFIG_LIBS)),\
		  )
LDLIBS += $(if $(PKG_CONFIG_LIBS), \
		  $(shell pkg-config --libs-only-l $(PKG_CONFIG_LIBS)), \
		  )
LDFLAGS += $(if $(PKG_CONFIG_LIBS), \
		   $(shell pkg-config --libs-only-L --libs-only-other $(PKG_CONFIG_LIBS)), \
		   )

SRC = $(wildcard *.c)
BIN = arena

all: $(BIN)

check: $(BIN)
	./$(BIN) $(CHECKFLAGS)

clean:
	$(RM) $(BIN)

lint:
	cppcheck --enable=all --inconclusive --language=c --suppress=missingIncludeSystem --quiet $(SRC)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@ $(LDFLAGS) $(LDLIBS)
