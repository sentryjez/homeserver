#!/bin/bash

docker pull linuxserver/sonarr:latest

mkdir -p /apps/sonarr
chown -R mediaserver /apps/sonarr

docker create \
--name=sonarr \
-v /apps/sonarr:/config \
-v /storage/downloads:/downloads \
-v /storage/downloads/movies:/series \
-v /etc/localtime:/etc/localtime:ro \
-e GID=1001 -e UID=1001 \
-p 8989:8989 \
linuxserver/sonarr

docker start sonarr
