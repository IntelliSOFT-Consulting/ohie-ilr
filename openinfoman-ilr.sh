#!/bin/bash

: ${ILR_HOST=localhost}

export ILR_HOST

cd ~/
cd /root/basex/bin && nohup ./basexhttp &
sudo add-apt-repository ppa:openhie/release
sudo apt-get update

echo "openinfoman openinfoman/dbname string provider_directory" | debconf-set-selections
echo "openinfoman openinfoman/memsize string 1g" | debconf-set-selections
echo "openinfoman openinfoman/baseurl string https://$ILR_HOST:5000" | debconf-set-selections

sudo apt-get -y install openinfoman-ilr
sudo apt-get install openinfoman-dhis
rsync -a ~/basex/resources/ /var/lib/openinfoman/resources/
