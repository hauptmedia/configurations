#!/bin/zsh
case $TTY in
	/dev/ttyp*)
	;;
	/dev/tty*|/dev/vc/*)
		clear
	;;
esac	
