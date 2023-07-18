# oracle-9-squid
Setup environment to show a problem in squid

It starts with an oracle base container and then installs squid into it, with a basic config file.
Prerequisites:
Ensure that you have a system with linux installed

How to run:
- Clone repo to some dir
- locally build your container: `docker compose build`
- Start your container `docker compose up -d`


Now the env is ready, and fire some requests to squid (to domains with various TTL's):
```
https_proxy="localhost:3128" curl https://<<domain1>>
https_proxy="localhost:3128" curl https://<<domain2>>
https_proxy="localhost:3128" curl https://<<domain3>>
```

Connect to the docker image to watch how the ipcache behaves:
```
docker exec -it oracle-9-squid-squid-1 squidclient mgr:ipcache
```

You should see that all requests are cached 60 seconds, regardless of the DNS TTL.




