FROM       ubuntu
MAINTAINER mokevnin

# ENV HOME /root

CMD ["/usr/bin/supervisord"]

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
RUN npm install -g tty.js

EXPOSE 8080
