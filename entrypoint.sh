#!/bin/bash
set -e

# move old files in dir to timestamped info:
LOGDIR="/var/log/squid/"
DATE=`date +%s`


find "$LOGDIR" -type f -name "*" -exec mv {} "{}.old.$DATE" \;

if [ $# -eq 0 ]; then
	/usr/libexec/squid/cache_swap.sh
	source /etc/sysconfig/squid
	exec /usr/sbin/squid -N $SQUID_OPTS -f $SQUID_CONF
else
	exec $@
fi

