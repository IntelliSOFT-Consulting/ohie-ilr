FROM ubuntu:14.04

USER root

RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties debconf-utils
RUN add-apt-repository ppa:openhie/release
RUN apt-get update

RUN echo "openinfoman openinfoman/dbname string provider_directory" | debconf-set-selections
RUN echo "openinfoman openinfoman/memsize string 1g" | debconf-set-selections
RUN echo "openinfoman openinfoman/baseurl string" | debconf-set-selections
RUN apt-get install -y openinfoman
