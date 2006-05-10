#!/usr/bin/env make

ifdef V
	Q=
else
	Q=@
endif

# here comes the first target, standard name "all"
all: startup
	@echo done.

startup: help FORCE
	@echo installing...
	$(Q)$(PWD)/_internal_/install.sh

help: FORCE
	@cat $(PWD)/_internal_/USAGE

# the force target, .PHONY could be used too, but FORCE is better for patches.
FORCE:

# Make the FORCE target phony.
.PHONY: FORCE
