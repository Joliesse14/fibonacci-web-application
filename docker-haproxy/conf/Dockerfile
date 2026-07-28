FROM ubuntu
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install vim procps tree curl iproute2 iputils-ping ncat less sudo
RUN apt-get -y install wrk apache2-utils redis-tools

COPY install.sh /
RUN /install.sh

CMD ["/usr/bin/myinit.sh"]
