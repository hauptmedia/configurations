TARGETS			:= example
TARGETS_CLEAN		:= $(TARGETS:=-clean)
TARGETS_DISTCLEAN	:= $(TARGETS:=-distclean)

CXX			:= g++
CXXFLAGS		:= -Wall -pedantic -O3
CC			:= gcc
CFLAGS			:= -Wall -pedantic -ansi -O3
#LDFLAGS		:= 

BASE_DIR		:= $(shell pwd)
#TMP_DIR		:= $(BASE_DIR)/tmp
#STAMP_DIR		:= $(TMP_DIR)/stamp

all: $(TARGETS)

clean: $(TARGETS_CLEAN)

distclean: $(TARGETS_DISTCLEAN)

#include $(BASE_DIR)/make/*.mk
# example targets «««

EXAMPLE_NAME := example
EXAMPLE_DIR := $(BASE_DIR)/example
EXAMPLE_OBJS := $(EXAMPLE_DIR)/main.o
EXAMPLE_PROG := $(EXAMPLE_DIR)/$(EXAMPLE_NAME)

$(EXAMPLE_PROG): $(EXAMPLE_OBJS)
	$(CC) -o $(EXAMPLE_PROG) $(EXAMPLE_OBJS)

example: $(EXAMPLE_PROG)

example-clean:
	-rm -f $(EXAMPLE_PROG) $(EXAMPLE_OBJS)

example-distclean: example-clean

# »»»

.PHONY: all $(TARGETS) clean $(TARGETS_CLEAN) distclean $(TARGETS_DISTCLEAN)

# vim600:set sw=8 ts=8 fdm=marker fmr=«««,»»»:
# vim:set ft=make:
