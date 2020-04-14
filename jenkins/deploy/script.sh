#!/bin/bash

##################################
## SEND INFORMATION ABOUT IMAGE ##
##################################

echo java > /tmp/.info
echo $TAG >> /tmp/.info
echo $PASS >> /tmp/.info

scp -i /srv/jenkins-key /tmp/.info jenkins@172.18.0.2:/home/jenkins/.info
scp -i /srv/jenkins-key jenkins/deploy/docker-compose.yml jenkins@172.18.0.2:/home/jenkins/docker-compose.yml
scp -i /srv/jenkins-key ./jenkins/deploy/deploy.sh jenkins@172.18.0.2:/home/jenkins/deploy.sh
ssh -i /srv/jenkins-key jenkins@172.18.0.2 "/home/jenkins/deploy.sh"
