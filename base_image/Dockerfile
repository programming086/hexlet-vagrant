FROM       ubuntu:trusty
MAINTAINER mokevnin

# ENV HOME /root

CMD ["/usr/bin/supervisord"]

RUN apt-get update

RUN apt-get install -y build-essential
RUN apt-get install -y git curl wget
RUN locale-gen en_US en_US.UTF-8

RUN apt-get install -y openssh-server
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor /var/run/sshd

# RUN apt-get install ruby
# RUN apt-get install ruby-dev

RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
RUN apt-get install -y python-setuptools
RUN easy_install pip

RUN add-apt-repository -y ppa:chris-lea/node.js

RUN apt-get update

RUN apt-get install -y nodejs

# EXPOSE 8080

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ONBUILD COPY services.conf /etc/supervisor/conf.d/services.conf

WORKDIR /root/exercise
