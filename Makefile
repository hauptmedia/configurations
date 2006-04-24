#!/usr/bin/env make

UPSTREAM_ARCHIVE := dreamind@dreamind.de--2006-dreamind.de
UPSTREAM_VERSION := configurations--mainline--0.1
UPSTREAM := $(UPSTREAM_ARCHIVE)/$(UPSTREAM_VERSION)

FILES := $(shell find . -mindepth 1 -maxdepth 1 \
		! -name {arch} \
		! -name .arch-ids \
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

check-missing: FORCE
	@echo Checking for missing patches...
	$(Q)$(PWD)/_internal_/check-missing.sh $(UPSTREAM)

replay: FORCE
	@echo Starting replay from mainline...
	$(Q)tla replay $(UPSTREAM)

star-merge: FORCE
	@echo Starting replay from mainline...
	$(Q)tla star-merge $(UPSTREAM)

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
