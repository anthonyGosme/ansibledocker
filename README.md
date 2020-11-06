# ansibledocker
 #build
 docker build . -t centos-ssh 

#start 
 docker run -d --expose 22 --name master  centos-ssh  
 docker run -d --expose 22 --name slave  centos-ssh 

#get IP
docker logs master| tail -n 1 
docker logs slave| tail -n 1 




#start slaves
docker-compose -f docker-compose-slave.yml build 
docker-compose -f docker-compose-slave.yml up -d --scale slave=5
docker-compose -f docker-compose-slave.yml logs  | grep 172
slave_2  | 172.18.0.6 
slave_3  | 172.18.0.5 
slave_5  | 172.18.0.4 
slave_4  | 172.18.0.7 
slave_1  | 172.18.0.2 




#enter master
docker exec -it  ansibledocker_master_1 /bin/sh
#install ansible in master

 dnf install epel-release -y
 dnf makecache
 dnf install ansible -y

ssh-keygen  -N '' -t ecdsa
rm /root/.ssh/known_hosts
 ssh-copy-id root@172.18.0.2


#ansible command
ansible 172.18.0.3 -m ping
ansible localhost -a "echo 'hello world'"
ansible root@172.18.0.2 -a "uname -a" -u setup

#add hosts
/etc/ansible/hosts
echo "hello world!" > file
ansible all -m copy -a"src=/file dest=/file" -u root