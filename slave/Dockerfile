FROM centos:8
RUN yum update -y
RUN yum -y install telnet passwd openssh openssh-clients openssh-server
COPY dockerrun.sh /home
RUN chmod 755 /home/dockerrunslave.sh
ENTRYPOINT ["/home/dockerrunslave.sh"]
EXPOSE 22