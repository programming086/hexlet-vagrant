FROM       node:0.10.32
MAINTAINER hexlet

RUN apt-get install -y supervisor

# RUN apt-get update

# RUN apt-get install -y build-essential
# RUN apt-get install -y git curl wget
# RUN locale-gen en_US en_US.UTF-8

# RUN mkdir -p /var/log/supervisor

# RUN apt-get install ruby
# RUN apt-get install ruby-dev

# RUN apt-get install -y python-software-properties
# RUN apt-get install -y software-properties-common
# RUN apt-get install -y python-setuptools
# RUN easy_install pip

# RUN add-apt-repository -y ppa:chris-lea/node.js

# RUN apt-get update

# RUN apt-get install -y nodejs
# FIXME set one worker


# RUN npm install -g hexlet-ide

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# RUN echo 'root:screencast' | chpasswd
ENV USER root
ENV HOME /root

EXPOSE 22
EXPOSE 80
EXPOSE 8000

WORKDIR /usr/src/app
CMD ["/usr/bin/supervisord"]

ONBUILD COPY services.conf /etc/supervisor/conf.d/services.conf
