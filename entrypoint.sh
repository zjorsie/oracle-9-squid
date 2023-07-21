#!/bin/bash
set -e

# move old files in dir to timestamped info:
LOGDIR="/var/log/squid/"
DATE=`date +%s`
SQUID_CONF="/etc/squid/squid.conf"

find "$LOGDIR" -type f -name "*" -exec mv {} "{}.old.$DATE" \;

if [ $# -eq 0 ]; then
	exec /usr/sbin/squid -N $SQUID_OPTS -f $SQUID_CONF
else
	exec $@
fi

