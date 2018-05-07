# homeserver
Fully containerized home/media-server based on Ubuntu 18.04 LTS.

Contains: 
Emby, sonarr, radarr and sabnzbd

Prereqs: 
Fresh install of Ubuntu Server 18.04 Minimal

Installation:

sudo apt -y install unzip

wget https://github.com/sentryjez/homeserver/archive/master.zip

unzip master.zip

cd homeserver-master

sudo /bin/bash ./inst.sh

