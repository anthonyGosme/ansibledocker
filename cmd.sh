#!/bin/bash
 #build
 docker build . -t centos-ssh 

#start 
docker run -d --expose 22 --name master  centos-ssh  
docker run -d --expose 22 --name slave  centos-ssh 

#get IP
docker logs master| tail -n 1 
docker logs slave| tail -n 1 

#enter
docker exec -it  master /bin/sh