#!/bin/bash
set -e
if [ $# -eq 0 ]; then
	    /usr/libexec/squid/cache_swap.sh
	        source /etc/sysconfig/squid
		    exec /usr/sbin/squid -N $SQUID_OPTS -f $SQUID_CONF
	    else
		        exec $@
fi

