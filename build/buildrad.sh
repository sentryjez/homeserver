#!/bin/bash

docker pull linuxserver/radarr:latest

mkdir -p /apps/radarr
chown -R usenet /apps/radarr

docker create \
--name=radarr \
-v /apps/radarr:/config \
#-v /appconf/radarr:/home/usenet/.config/Radarr \
-v /storage/downloads:/downloads \
-v /storage/downloads/movies:/movies \
-v /etc/localtime:/etc/localtime:ro \
-e GID=1001 -e UID=1001 \
-p 7878:7878 \
linuxserver/radarr

docker start radarr


 
