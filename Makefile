.PHONY: all check clean

CFLAGS ?= -Og -g -pedantic -std=c99 -Wall -Werror -Wextra -Wfatal-errors \
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

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@ $(LDFLAGS) $(LDLIBS)
