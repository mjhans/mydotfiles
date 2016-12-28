#!/usr/bin/env bash

# ubuntu 14.04

which mongo
if [ $? -eq 0 ];then
	echo "  mongodb is already installed!"
else
	echo "  mongodb is installing..."
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
	echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
	sudo apt-get update
	sudo apt-get install -y mongodb-org
fi
