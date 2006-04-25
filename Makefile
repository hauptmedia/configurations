#!/usr/bin/env make

FILES := $(shell find . -mindepth 1 -maxdepth 1 \
		! -name .git \
		! -name .gitignore \
		! -name Makefile \
		! -name _internal_ \
		| sed 's:^\./bin$$:$(HOME)/bin:' \
		| sed 's:^\./:$(HOME)/.:')

ifdef V
	Q=
else
	Q=@
endif

# here comes the first target, standard name "all"
all: startup $(FILES)
	@echo done.

startup: help
	@echo installing...

help: FORCE
	@cat $(PWD)/_internal_/USAGE

# bin install target
$(HOME)/bin: $(PWD)/bin
	$(Q)$(PWD)/_internal_/install.sh $< $@

# default install target.
$(HOME)/.%: $(PWD)/%
	$(Q)$(PWD)/_internal_/install.sh $< $@

# the force target, .PHONY could be used too, but FORCE is better for patches.
FORCE:

# Make the FORCE target phony.
.PHONY: FORCE
