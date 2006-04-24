#!/usr/bin/env zsh
upstream=$1

missing=$(tla missing -s 2>&1)
exitval=0

if [ $# -ne 1 ]; then
	echo "Usage: check-missing.sh upstream_version" >&2
	exit 1
fi

if [ ! -z "$missing" ];  then
	echo "The following patches are missing:"
	echo $missing
	exitval=1
fi

if [ "$(cat \{arch\}/++default-version)" != $upstream ]; then
	missing=$(tla missing -s $upstream)

	if [ ! -z "$missing" ]; then
		if [ $exitval -ne 0 ]; then
			echo
		fi
		echo "The following upstream patches are missing:"
		echo $missing
		exitval=1
	fi
fi

if [ $exitval -ne 0 ]; then
	exit $exitval
else
	echo "No patches are missing."
	exit $exitval
fi
