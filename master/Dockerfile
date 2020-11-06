FROM centos:8
RUN yum update -y
RUN yum -y install telnet passwd openssh openssh-clients openssh-server
COPY master/dockerrunmaster.sh /home
ADD /master/playbook /etc/ansible/playbook
RUN chmod 755 /home/dockerrunmaster.sh
ENTRYPOINT ["/home/dockerrunmaster.sh"]
EXPOSE 22