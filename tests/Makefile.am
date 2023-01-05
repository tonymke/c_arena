TESTS = check_c_arena

check_PROGRAMS = check_c_arena
check_c_arena_SOURCES = check_c_arena.c \
						$(top_srcdir)/src/c_arena.h
check_c_arena_CFLAGS = -I $(top_srcdir)/src/
check_c_arena_LDADD = $(top_builddir)/src/libc_arena.la

noinst_HEADERS = $(top_srcdir)/src/c_arena.h
