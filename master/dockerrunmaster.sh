#!/bin/bash -x
dnf install epel-release -y
dnf makecache
dnf install ansible -y
mkdir /etc/ansible/playbook 
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
ssh-keygen -f /root/.ssh/id_rsa -N '' -t rsa

mkdir -p /root/.ssh
touch /root/.ssh/authorized_keys
echo ${PUBLIC_KEY} > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
echo toto | passwd root --stdin
hostname -I

ssh-copy-id root@172.18.0.2
ssh-copy-id root@172.18.0.4
ssh-copy-id root@172.18.0.5
ssh-copy-id root@172.18.0.6
ssh-copy-id root@172.18.0.7
    

/usr/sbin/sshd -D
ssh root@127.0.0.1