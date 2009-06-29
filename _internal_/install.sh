#!/usr/bin/env zsh
#
# Small install script for configurations.
#
# Written by Stefan Pfetzing <dreamind@dreamind.de>
#

setopt NULL_GLOB

if [ "$(basename $(pwd))" = "_internal_" ]; then
	echo "Please do not execute this script directly." >&2
	echo "Quitting." >&2
	exit 1
fi

if [ -z "$HOME" ]; then
	echo 'Please make sure the $HOME environment variable is set.' >&2
	echo "Quitting." >&2
	exit 2
fi

zmodload zsh/stat
if [ $? -ne 0 ]; then
	echo "The zsh/stat module is not availible." >&2
	echo "Quitting." >&2
	exit 3
fi


vcmd() {
	if [ "$V" ]; then
		echo $@
	fi
	$@
}

install_func() {
	src=$1
	dst=$2

	stat_arr=()
	# check if the dst already links to src.
	if [ -e "$dst" ]; then
		stat -L -A stat_arr $dst
		if [ "$stat_arr[14]" = "$src" ]; then
			if [ "$V" ]; then
				echo "Ignoring $(basename $src), already links to $dst"
			fi
			return 0
		fi
	fi

	if [ -f $dst -o -d $dst ] && [ ! -h $dst ]; then
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
}

for object in .* *; do
	case $object in
		# To ignore
		.git|.gitignore|makefile|GNUmakefile|_internal_|*.swp)
			if [ "$V" ]; then
				echo "ignoring $object" >&2
			fi
			;;
		# Directories / Files without a dot
		bin)
			if [ "$V" ]; then
				echo "using $object" >&2
			fi
			install_func $(pwd)/$object $HOME/$object
			;;
		*)
			if [ "$V" ]; then
				echo "using $object" >&2
			fi
			install_func $(pwd)/$object $HOME/.$object
			;;
	esac
done


# vim:set ft=zsh:
