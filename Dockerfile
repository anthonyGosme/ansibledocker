FROM centos:8
RUN yum update -y
RUN yum -y install telnet passwd openssh openssh-clients openssh-server
COPY dockerrun.sh /home
RUN chmod 755 /home/dockerrun.sh
ENTRYPOINT ["/home/dockerrun.sh"]
EXPOSE 22