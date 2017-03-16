FROM ubuntu:14.04

USER root

RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:openhie/release
RUN apt-get update
RUN apt-get -y install openinfoman
