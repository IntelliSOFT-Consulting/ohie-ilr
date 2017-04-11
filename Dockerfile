FROM uwitech/ohie-base

USER root

#install openinfoman

RUN apt-get update
COPY BaseX862.zip /root/BaseX862.zip
RUN apt-get -y install software-properties-common \
python-software-properties \
wget \
inotify-tools \
debconf-utils unzip \
git \
default-jre \
openjdk-7-jre
RUN unzip ~/BaseX862.zip -d ~/
RUN touch ~/basex/.basexhome
RUN chmod 777 -R ~/basex
RUN git clone https://github.com/openhie/openinfoman ~/openinfoman

COPY basex.sh /root/basex.sh
RUN chmod 777 ~/basex.sh
RUN ~/./basex.sh

COPY web.xml /root/basex/webapp/WEB-INF/web.xml 
COPY csd_lsd.xqm /var/lib/openinfoman/repo/com/github/openhie/openinfoman/csd_lsd.xqm

#install openinfoman-ilr

COPY openinfoman-ilr.sh /root/openinfoman-ilr.sh
RUN chmod 777 ~/openinfoman-ilr.sh
RUN ~/./openinfoman-ilr.sh

#install openinfoman-hwr

RUN apt-get -y install openinfoman-hwr

#start service with logs

CMD /var/lib/openinfoman/bin/./basexhttp
