#!/bin/bash

##########################################
## PUSHING THE APP IN MY DOCKER ACCOUNT ##
##########################################

IMAGE=java

docker login -u vahidpirian -p $PASS
docker tag $IMAGE:$TAG vahidpirian/$IMAGE:$TAG
docker push vahidpirian/$IMAGE:$TAG
