#!/bin/bash

touch /tmp/tmp.txt
tmp_txt=/tmp/tmp.txt

function message {
	whiptail --title "$title" --msgbox "$text" 10 70
}

function addu {
	useradd -M -u $uid -g $gid -s /sbin/nologin $module
}

function yesno {
ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:$port
val=`source $tmp_txt && echo $[$app]`
if (whiptail --title "$app" --yesno "$text" 10 70)
then
	echo $app=1 >> $tmp_txt && /bin/bash ./build/$app'.sh' &>/dev/null & \
	sudo echo " Go to $url for $app" >> /etc/issue
else
	echo $app=0 >> $tmp_txt
fi
}

######################################################################
#1.Update
###		Update the fresh install

apt -y update && apt -y upgrade

######################################################################
#2.Install the required packages to build our homeserver
###		Instal Docker and the Cockpit-webgui

apt -y install docker.io cockpit cockpit-docker
ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:$port
sudo echo " Go to $url for $app" >> /etc/issue

######################################################################
#3.TUI

title=Welcome
text='Welcome to the automated Home/Media-server presented by SentryJez.' \
message

uid=1001
gid=1001
module=mediaserver
text='Would you like to deploy a Media-server-stack?'
if (whiptail --title "$module" --yesno "$text" 10 70)
then
	echo $module=1 >> $tmp_txt \
	&& addu \
	&& app=Radarr 
	port=7878
	text='Would you like to install Radarr?'
	yesno \
	&& app=Sonarr
	text='Would you like to install Sonarr?'
	port=8989
	yesno \
	&& app=Sabnzbd 
	text='Would you like to install Sabnzbd?'
	port=8080
	yesno \
	&& app=Emby 
	text='Would you like to install Emby?'
	port=8096
	yesno
fi

reboot now
