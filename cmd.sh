#!/bin/bash
docker build . -t centos-ssh
docker exec -itd centos-ssh /bin/bash 
