#!/bin/bash

cd ~/
cd /root/basex/bin && nohup ./basexhttp &
sudo add-apt-repository ppa:openhie/release
sudo apt-get update

echo "openinfoman openinfoman/dbname string provider_directory" | debconf-set-selections
echo "openinfoman openinfoman/memsize string 1g" | debconf-set-selections
echo "openinfoman openinfoman/baseurl string" | debconf-set-selections
sudo apt-get -y install openinfoman-ilr
