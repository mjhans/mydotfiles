#!/usr/bin/env bash

sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer

sudo apt-get install tomcat7
sudo apt-get install apache2
