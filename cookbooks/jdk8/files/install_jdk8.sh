#!/bin/bash
sudo apt-get -y -q install software-properties-common htop
sudo echo -ne '\n' | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y -q update
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y -q install oracle-java8-installer
sudo update-java-alternatives -s java-8-oracle
sudo apt-get install oracle-java8-set-default
sudo echo -ne '\n' | sudo add-apt-repository --remove ppa:webupd8team/java
sudo apt-get -y -q update
