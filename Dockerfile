FROM uwitech/ohie-base

USER root

RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties debconf-utils
COPY openinfoman /etc/init.d/openinfoman
RUN chmod 777 /etc/init.d/openinfoman
RUN add-apt-repository ppa:openhie/release
RUN apt-get update

RUN echo "openinfoman openinfoman/dbname string provider_directory" | debconf-set-selections
RUN echo "openinfoman openinfoman/memsize string 1g" | debconf-set-selections
RUN echo "openinfoman openinfoman/baseurl string" | debconf-set-selections
CMD apt-get -y install openinfoman openinfoman-ilr
