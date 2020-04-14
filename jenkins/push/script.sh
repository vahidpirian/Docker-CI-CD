#!/bin/bash

##############################################
## PUSHING THE APP IN MY DOCKER HUB ACCOUNT ##
##############################################

IMAGE=java

docker login -u vahidpirian -p $PASS
docker tag $IMAGE:$TAG vahidpirian/$IMAGE:$TAG
docker push vahidpirian/$IMAGE:$TAG


# PASS => define the variable in local machine
# TAG => define the variable in local machin
# USERNAME => your username account docker hub
# IMAGE => your app image
