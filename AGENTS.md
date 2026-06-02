# AGENTS.md

## Scope

These instructions apply to the entire repository.

## Repository Overview

This is a small C scratchpad arena. It uses autotools and currently builds one
program, `arena`, from sources under `src/`.

Important files:

- `configure.ac`: top-level autoconf configuration.
- `Makefile.am`: top-level automake entry point.
- `src/Makefile.am`: program and source declarations.
- `src/main.c`: current C entry point.
- `.clang-format`: committed formatter configuration for kernel C style.
- `README.md`: setup notes and license.

## Build And Run

Use the README-supported autotools flow:

```sh
autoreconf -i
./configure "CFLAGS=-std=gnu23 -Wall -Wextra -Werror"
make
src/arena
```

For C or build-system changes, at least run `make` after configuring. Run
`src/arena` as a smoke test when behavior could have changed.

Generated autotools files are intentionally gitignored. Do not commit generated
files such as `configure`, `Makefile.in`, `config.h.in`, `config.status`, or
`autom4te.cache/` unless the repository policy is explicitly changed.

## C Style

Kernel C coding style is preferred. The committed `.clang-format` is the source
of truth; format touched C files with clang-format before finishing.

Useful formatter examples:

```sh
clang-format -i src/main.c
clang-format -i path/to/file.c path/to/file.h
```

Style details reflected by the formatter:

- Use tabs for indentation, with an 8-column tab width.
- Keep lines at or below 80 columns where practical.
- Use kernel-style braces: function opening braces on their own line, control
  statement opening braces on the same line.
- Do not compress short functions, `if` statements, loops, or blocks onto one
  line.
- Preserve include order; the formatter is configured not to sort includes.

For C files that depend on autotools configuration macros, keep
`#include <config.h>` before system headers.

## Build-System Changes

Keep the autotools setup simple and close to the existing pattern.

- Add or remove program sources in `src/Makefile.am`.
- If adding subdirectories, update top-level `SUBDIRS` and add the matching
  generated makefiles to `AC_CONFIG_FILES` in `configure.ac`.
- Prefer passing maintainer/debug flags through `./configure "CFLAGS=..."` over
  hard-coding them into the project unless there is a project-wide reason.
- After changing `configure.ac` or any `Makefile.am`, rerun `autoreconf -i`,
  then configure and build locally.

## Tests

There is no dedicated test suite yet. Treat the configure/build/run sequence as
the current smoke test.

If tests are added, wire them into automake so `make check` works, and update
this file or the README with the new command.

## Git Hygiene

Keep changes focused and avoid unrelated cleanup in this scratchpad repo.
Generated build artifacts, local binaries, object files, and editor-specific
state should stay untracked.
