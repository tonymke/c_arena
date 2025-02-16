.PHONY: all check clean lint

CFLAGS ?= -Og -g -pedantic -Wall -Werror -Wextra -Wfatal-errors \
		  -Wno-error=pedantic -Wno-error=unused-parameter
CFLAGS += -I$(SRCDIR) $(if $(wildcard include),-Iinclude)

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

SRCDIR = src
DISTDIR = dist
SRC = $(wildcard $(SRCDIR)/*.c)
HEADERS = $(wildcard $(SRCDIR)/*.h) $(wildcard include/*.h)
BIN = $(DISTDIR)/arena

all: $(BIN)

check: $(BIN)
	$(foreach bin,$^,$(CURDIR)/$(bin) $(CHECKFLAGS);)

clean:
	$(RM) -rf $(DISTDIR)

lint:
	cppcheck --enable=all --inconclusive --language=c --suppress=missingIncludeSystem --quiet $(SRC)

$(BIN): $(SRC) $(HEADERS) | $(DISTDIR)
	$(CC) $(CFLAGS) $(SRC) -o $@ $(LDFLAGS) $(LDLIBS)

$(DISTDIR):
	mkdir -p $@
