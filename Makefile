SRC := $(wildcard src/*.c)
OBJ := $(SRC:%.c=%.o)
HEADER := $(wildcard src/*.h)
BIN := arena

CFLAGS ?= -Og -g -Wall -Wextra

-include Makefile.local

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

export CFLAGS
export CHECKFLAGS
export LDFLAGS
export LDLIBS

.PHONY: all
all: $(BIN)

.PHONY: check
check: $(BIN)
	$(realpath $(BIN))

.PHONY: clean
clean:
	$(RM) $(BIN)

$(BIN): $(SRC) $(HEADER)
	$(CC) $(CFLAGS) -o $@ $(SRC) $(LDFLAGS) $(LDLIBS)
