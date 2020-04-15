#!/bin/bash

 #########################################################
 ## This script for build jar from maven:3-alpine image ##
 ########################################################

docker run --rm -v $PWD/java:/java -v /root/.m2/:/root/.m2/ -w /java maven:3-alpine "$@"

## /java:/java => Mount the project in the image
## /root/.m2/:/root/.m2/ => Save all downloaded packages when Build jar
## $@ => For get inputs from the user
