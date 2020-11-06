FROM ubuntu
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install openssh-server -y
#RUN yum update -y
#RUN yum -y install telnet passwd openssh openssh-clients openssh-server
COPY dockerrunslave.sh /home
RUN chmod 755 /home/dockerrunslave.sh
EXPOSE 22
ENTRYPOINT ["/home/dockerrunslave.sh"]
