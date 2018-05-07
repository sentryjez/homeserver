#!/bin/bash

docker pull emby/embyserver:latest

mkdir -p /apps/emby
chown -R usenet /apps/emby

docker create \
--name=emby \
-v /apps/emby:/config \
-v /storage/downloads:/downloads \
-v /etc/localtime:/etc/localtime:ro \
-e GID=1001 -e UID=1001 \
-p 8096:8096 \
-p 8920:8920 \
emby/embyserver

docker start emby
