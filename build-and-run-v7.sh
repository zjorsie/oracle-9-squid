#!/bin/bash

# build container:

docker compose -f ./docker-compose-build-v7.yml build
docker compose -f ./docker-compose-build-v7.yml down
docker compose -f ./docker-compose-build-v7.yml up -d

bash ./useful_commands.sh
