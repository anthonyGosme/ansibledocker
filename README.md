# ansibledocker
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

#install ansible in master



docker-compose -f docker-compose-slave.yml



 dnf install epel-release -y
 dnf makecache
 dnf install ansible -y

 ssh-copy-id root@172.18.0.2


#ansible command
ansible 172.18.0.3 -m ping
ansible localhost -a "echo 'hello world'"
ansible root@172.18.0.2 -a "uname -a" -u setup

#add hosts
/etc/ansible/hosts