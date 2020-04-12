!#/bin/bash

############################################
## Copy the new jar to the build location ## 
##    and run the docker-compose file     ##
############################################

cp -f java/target/*.jar jenkins/build/
cd jenkins/build/ && docker-compose build --no-cache
