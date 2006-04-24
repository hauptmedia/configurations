#!/bin/zsh
#
# This is a configuration example from http://www.dreamind.de/
#
# the rest of the configuration can be found in ~/.zsh
#

setopt extended_glob
# This has all been split into external files.
for file in ~/.zsh/*(-.); do
	source $file
done

