#!/bin/zsh
if ps xa|awk '{if ($1 == "'$PPID'") print $0}'|grep -q lsh && [ -e /etc/motd ]; then
	echo "$(< /etc/motd)"
fi
