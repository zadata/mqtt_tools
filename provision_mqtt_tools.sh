#! /bin/bash

# provision MQTT and MQTT-SN CLI tools

# Author: Zvi Avraham <zvi AT zadata DOT com>
# Copyright 2014 ZADATA Ltd. All Rights Reserved.

sudo apt-get update -f
sudo apt-get upgrade

sudo apt-get install -y wget

HOME_DIR=/home/vagrant

# install MQTT-SN CLI tools
sudo apt-get install -y build-essential make
cd $HOME_DIR
wget https://github.com/njh/mqtt-sn-tools/archive/master.tar.gz
tar xzf master.tar.gz
rm master.tar.gz
cd mqtt-sn-tools-master/
make
echo "export PATH=$PATH:$HOME_DIR/mqtt-sn-tools-master/" >> $HOME_DIR/.bashrc

# install mosquitto fro it's mosquitto_pub/sub CLI tools
sudo apt-get install -y build-essential libtool m4 autoconf openssl libssl-dev libc-ares-dev
cd $HOME_DIR
wget http://mosquitto.org/files/source/mosquitto-1.3.2.tar.gz
tar xzf mosquitto-1.3.2.tar.gz
rm mosquitto-1.3.2.tar.gz
cd mosquitto-1.3.2
make
sudo make install
rm -rf mosquitto-1.3.2/
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> $HOME_DIR/.bashrc
