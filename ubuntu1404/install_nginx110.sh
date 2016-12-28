#!/usr/bin/env bash

nginx=stable # use nginx=development for latest development version
sudo add-apt-repository ppa:nginx/$nginx
sudo apt-get update
sudo apt-get install -y nginx
