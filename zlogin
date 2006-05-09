#!/bin/zsh
#
# A small example how to get back a /etc/motd at login when using lsh.
# Note: this is badly broken on OS != Linux.
#
#if ps xa|awk '{if ($1 == "'$PPID'") print $0}'|grep -q lsh && [ -e /etc/motd ]; then
#	echo "$(< /etc/motd)"
#fi
