#!/bin/bash

docker pull sabnzbd/sabnzbd:latest

mkdir -p /apps/sabnzbd
chown -R mediaserver /apps/sabnzbd

docker create \
--name=sabnzbd \
-v /apps/sabnzbd:/datadir \
-v /storage/downloads:/downloads \
-v /etc/localtime:/etc/localtime:ro \
-e GID=1001 -e UID=1001 \
-p 8080:8080 \
sabnzbd/sabnzbd

docker start sabnzbd
