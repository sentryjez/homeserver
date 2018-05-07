#!/bin/bash

#1.Update
###		Update the fresh install
apt update && apt upgrade

#2.Install the required packages to build our homeserver
###		Instal Docker and the Cockpit-webgui
apt -y install docker.io cockpit cockpit-docker

#3.Media-stack
##	3.1.Prereqs
###		Install an user with no /home-directory an shell-login
useradd -M -u 1001 -g 1001 -s /sbin/nologin usenet

##	3.2.Build the Docker-Containers and get them started
###		Script for "Radarr"-container
/bin/bash ./build/buildrad.sh

###		Script for "Sonarr"-container
/bin/bash ./build/buildson.sh

###		Script for "Sabnzbd"-container
/bin/bash ./build/buildsab.sh

###		Script for "Emby"-container
/bin/bash ./build/buildemb.sh

#99.Post-install
##	99.1.Display Url's to manage our System and Containers at bootup
###		Cockpit-webgui 
ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:9090
sudo echo " Go to $url for Server-management" >> /etc/issue

###		Radarr-webgui
ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:7878
sudo echo " Go to $url for Radarr" >> /etc/issue

###		Sonarr-webgui
ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:8989
sudo echo " Go to $url for Sonarr" >> /etc/issue

###		Sabnzbd-webgui
ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:8080
echo " Go to $url for Sabnzbd" | sudo tee --append /etc/issue

###		Emby-webgui
ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:8096
echo " Go to $url for Emby" | sudo tee --append /etc/issue

##	99.99.Reboot
reboot now




