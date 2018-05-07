#!/bin/bash

apt update && apt upgrade

apt -y install docker.io cockpit cockpit-docker

useradd -M -u 1001 -g 1001 -s /sbin/nologin usenet

/bin/bash ./build/buildrad.sh

/bin/bash ./build/buildson.sh

/bin/bash ./build/buildsab.sh

/bin/bash ./build/buildemb.sh




