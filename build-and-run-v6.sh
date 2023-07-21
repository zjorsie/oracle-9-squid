#!/bin/bash

# build container:

docker compose -f ./docker-compose-build-v6.yml build && docker compose -f ./docker-compose-build-v6.yml down && docker compose -f ./docker-compose-build-v6.yml up -d && bash ./useful_commands.sh
