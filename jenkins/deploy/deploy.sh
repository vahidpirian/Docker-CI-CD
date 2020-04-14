#!/bin/bash

###################################################
## This script is being ran into the remote host ##
###################################################

export IMAGE=$(sed -n '1p' /home/jenkins/.info)
export TAG=$(sed -n '2p' /home/jenkins/.info)
export PASS=$(sed -n '3p' /home/jenkins/.info)

docker login -u vahidpirian -p $PASS
cd ~ && docker-compose up -d
