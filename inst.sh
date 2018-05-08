#!/bin/bash

tmp_txt=/tmp/tmp.txt

function message {
	whiptail --title "$title" --msgbox "$text" $h $w
}

function yesno {
	whiptail --title "$title" --yesno "$text" $h $w
}

function tmp {
	echo $title=$? >> $tmp_txt
}

function addu {
	useradd -M -u $uid -g $gid -s /sbin/nologin $user
}


val=`source $tmp_txt | echo $app`

function proc {
	if [ $val =1 ]; then
		/bin/bash ./build/$build
	else
		echo "$app will not be installed "
	fi
}


######################################################################
#1.Update
###		Update the fresh install

apt update && apt upgrade

######################################################################
#2.Install the required packages to build our homeserver
###		Instal Docker and the Cockpit-webgui

apt -y install docker.io cockpit cockpit-docker

######################################################################
#3.TUI

h=10
w=70

title='Welcome'
text='Welcome to the automated Home/Media-server presented by SentryJez.'
message

title='Media-stack'
text='Would you like to deploy a Media-stack, with apps like Emby, Sonarr,etc...?'
yesno
tmp

title='Radarr'
text='Would you like to install Radarr?'
yesno
tmp

title='Sonarr'
text='Would you like to install Sonarr?'
yesno
tmp

title='Sabnzbd'
text='Would you like to install Sabnzbd?'
yesno
tmp

title='Emby'
text='Would you like to install Emby?'
yesno
tmp

######################################################################
#20.Media-stack
##	20.1.Prereqs
###		Install an user with no /home-directory an shell-login

uid=1001
gid=1001
user=usenet
addu

##	20.2.Build the Docker-Containers and get them started

###		Script for "Radarr"-container

app=Radarr
build=buildrad.sh
proc

###		Script for "Sonarr"-container

app=Sonarr
build=buildson.sh
proc

###		Script for "Sabnzbd"-container

app=Sabnzbd
build=buildsab.sh
proc

###		Script for "Emby"-container

app=Emby
build=buildemb.sh
proc


######################################################################
#99.Post-install
##	99.1.Display Url's to manage our System and Containers at bootup

ipaddr=`hostname -I | cut -d\  -f1`
url=$ipaddr:$port
function disp {
	echo " Go to $url for $app" | sudo tee --append /etc/issue
}

###		Cockpit-webgui 
app=Cockpit-webgui
port=9090
disp

###		Radarr-webgui
app=Radarr
port=7878
disp

###		Sonarr-webgui
app=Sonarr
port=8989
disp

###		Sabnzbd-webgui
app=Sabnzbd
port=8080
disp

###		Emby-webgui
app=Emby
port=8096
disp

##	99.99.Reboot

title='Reboot'
text='Press OK to reboot, WebGUI-adresses will be displayed when rebooted.'
message

reboot now






