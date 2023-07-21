#!/bin/bash


echo "Some commands are: "
echo "docker logs -f oracle-9-squid-squid-1"
echo "docker exec -it oracle-9-squid-squid-1 bash "
echo "docker exec -it oracle-9-squid-squid-1 squidclient mgr:ipcache "
echo "docker exec -it oracle-9-squid-squid-1 tail -f /var/log/squid/cache.log "
echo "docker exec -it oracle-9-squid-squid-1 tail -f /var/log/squid/squid.log "
echo "http_proxy="localhost:3128" https_proxy="localhost:3128" curl "
echo "http_proxy="localhost:3128" https_proxy="localhost:3128" curl http://localhost:3128/squid-internal-mgr/ipcache"

