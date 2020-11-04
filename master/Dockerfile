FROM centos:8
RUN yum update -y
RUN yum -y install telnet passwd openssh openssh-clients openssh-server
COPY dockerrun.sh /home
RUN chmod 755 /home/dockerrunmaster.sh
ENTRYPOINT ["/home/dockerrunmaster.sh"]
EXPOSE 22