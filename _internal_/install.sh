#!/usr/bin/env zsh
#
# Small install script for configurations.
#
# Written by Stefan Pfetzing <dreamind@dreamind.de>
#

src=$1
dst=$2

vcmd() {
	if [ "$V" ]; then
		echo $@
	fi
	$@
}

if [ -f $dst ]||[ -d $dst ]; then
	if [ -z "$F" ]; then
		echo -n "$dst exists... overwrite? [y/n]: "
		read -q overwrite
		if [ "$overwrite" = "y" ]; then
			vcmd mkdir -p ~/OLD
			vcmd mv $dst ~/OLD/$(basename $src)
			vcmd ln -s $src $dst
		fi
	else
		echo "overwriting $dst."
		vcmd mkdir -p ~/OLD
		vcmd mv $dst ~/OLD/$(basename $src)
		vcmd ln -s $src $dst
	fi
else
	vcmd rm -f $dst
	if [ -z "$V" ]; then
		echo Installing $(basename $dst) configuration.
	fi
	vcmd ln -s $src $dst
fi

# a newline afterwards, to clean up the output (only when using verbose mode)
if [ "$V" ]; then
	echo
fi
