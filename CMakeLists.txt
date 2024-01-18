cmake_minimum_required(VERSION 3.24)
project(ccaniuse)

include(CheckSourceCompiles)

# Check for anonymous structures and unions
check_source_compiles(C
"struct T { int tag; union { float x; int n; }; };
int main(void) { struct T t; t.tag = 1; t.x = 1.0f; return 1; }"
HAVE_ANONYMOUS_STRUCT_UNION)

# Check for noreturn
check_source_compiles(C
"#include <stdnoreturn.h>
noreturn void f(void) {}
int main(void) { f(); return 1; }"
HAVE_NORETURN)

# Check for static_assert
check_source_compiles(C
"#include <assert.h>
int main(void) { static_assert(1, \"\"); return 1; }"
HAVE_STATIC_ASSERT)

configure_file(config.h.in config.h)
