.PHONY: all check clean lint

CFLAGS ?= -Og -g -pedantic -Wall -Werror -Wextra -Wfatal-errors \
		  -Wno-error=pedantic -Wno-error=unused-parameter

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

all:
	$(MAKE) -C src all

check:
	$(MAKE) -C src check

clean:
	$(MAKE) -C src clean

lint:
	$(MAKE) -C src lint

src/%:
	$(MAKE) -C src $(patsubst src/%,%,$@)
