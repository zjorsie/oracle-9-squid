# oracle-9-squid
Setup environment to show a problem in squid version 5.5.

It starts with an oracle base container,installs squid 5.5 and plugs a very basic config file into the squid config dir. It listens at localhost:3128 with HOST networking enabled.

Prerequisites:
Ensure that you have a system with linux installed

How to run:
- Clone repo to some dir
- locally build your container: `docker compose build`
- Start your container `docker compose up -d`
- Fire up requests to proxy from localhost (`https_proxy="localhost:3128" curl https://<<domain>>`)
- Watch the squid proxy internal ipcache: `docker exec -it oracle-9-squid-squid-1 squidclient mgr:ipcache`

Apart from that you can see the logs, which are inside the container at `/var/log/squid`. Each startup they are rotated, to prevent large cache.logs.

- Restart stack: `docker compose down && docker compose up -d`
- Get a shell inside the container: `docker exec -it oracle-9-squid-squid-1 bash` 

This should show entries from requests done above with an original TTL of 60 (TTL + lstref).

Please do not use this container other than to showcase the error above!


