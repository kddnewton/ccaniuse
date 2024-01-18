project(ccaniuse)
cmake_minimum_required(VERSION 3.24)

include(CheckSymbolExists)
check_symbol_exists(exp "math.h" HAVE_EXP)
check_symbol_exists(foobar, "math.h" HAVE_FOOBAR)

configure_file(config.h.in config.h)
