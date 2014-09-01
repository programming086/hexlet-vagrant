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
RUN add-apt-repository -y ppa:nginx/stable

RUN apt-get update

RUN apt-get install -y nodejs
# FIXME set one worker
RUN apt-get install -y nginx

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
# RUN chown -R www-data:www-data /var/lib/nginx

ENV USER root

RUN npm install -g codebox

RUN mkdir -p /root/.ssh
ADD authorized_keys /root/.ssh/authorized_keys

EXPOSE 22
EXPOSE 80
EXPOSE 8000

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ONBUILD COPY services.conf /etc/supervisor/conf.d/services.conf

WORKDIR /root/exercise

COPY nginx_codebox.conf /etc/nginx/conf.d/codebox.conf
# RUN echo 'root:screencast' | chpasswd
