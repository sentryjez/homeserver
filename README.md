# Homeserver

###### Fully containerized home/media-server based on Ubuntu 18.04 LTS.


This is a series of scripts to automatically install various apps to run an Home/Mediaserver-instance



## Contains 


[**Emby**](https://emby.media/) : A Media server, wich scans, organizes an streams your media. Easy integration with [**Kodi**](https://kodi.tv/) .

[**Sonarr**](https://sonarr.tv/) : A nzb-indexer for searching TV-series.

[**Radarr**](https://radarr.video/) : A nzb-indexer for searching Movies.

[**Sabnzbd**](https://sabnzbd.org/) : A binary newsreader and download-client.



## Prereqs 


Fresh install of Ubuntu Server 18.04 Minimal



## Deployement


Please enter these commands in your terminal, the configuration will start:

```
sudo apt -y install unzip

wget https://github.com/sentryjez/homeserver/archive/master.zip

unzip master.zip

cd homeserver-master

sudo /bin/bash ./inst.sh
```
