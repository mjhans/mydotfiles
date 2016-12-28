#!/usr/bin/env bash

sudo apt-get install -y software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://ftp.kaist.ac.kr/mariadb/repo/5.5/ubuntu trusty main'
sudo apt-get update
sudo apt-get install -y mariadb-server
