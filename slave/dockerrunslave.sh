#!/bin/bash -x
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

ssh-keygen -f /root/.ssh/id_rsa -N '' -t rsa

mkdir -p /root/.ssh
touch /root/.ssh/authorized_keys
echo ${PUBLIC_KEY} > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
echo -e "toto" | passwd root --stdin
hostname -I
#echo "pwd" | passwd --stdin ansible
echo "root:toto" |  chpasswd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
service ssh restart
ssh root@127.0.0.1
while true; do
  sleep 1000
done

echo "root:toto" |  chpasswd