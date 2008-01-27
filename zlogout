#!/bin/zsh
case $TTY in
	/dev/ttyp*)
	;;
	/dev/ttys*)
	;;
	/dev/tty*|/dev/vc/*)
		clear
	;;
esac	
