#! /bin/bash

# provision MQTT and MQTT-SN CLI tools

# Author: Zvi Avraham <zvi AT zadata DOT com>
# Copyright 2012-2016 ZADATA Ltd. All Rights Reserved.

HOME_DIR=/home/vagrant

sudo apt-get update
sudo apt-get upgrade -f

sudo apt-get install -y wget

################################################################################
# install git
################################################################################
sudo apt-get install -y git-core
#git config --global user.email $USER_EMAIL
#git config --global user.name $USER_NAME

################################################################################
# install MQTT-SN CLI tools
################################################################################
sudo apt-get install -y build-essential make
cd ${HOME_DIR}
wget https://github.com/njh/mqtt-sn-tools/archive/master.tar.gz
tar xzf master.tar.gz
rm master.tar.gz
cd mqtt-sn-tools-master/
make
echo "export PATH=\$PATH:$HOME_DIR/mqtt-sn-tools-master/" >> $HOME_DIR/.bashrc

################################################################################
# install mosquitto fro it's mosquitto_pub/sub CLI tools
# http://mosquitto.org/download/
################################################################################
MOSQUITTO_TARGZ_URL="http://mosquitto.org/files/source/mosquitto-1.4.5.tar.gz"
MOSQUITTO_TARGZ_FILE=$(basename ${MOSQUITTO_TARGZ_URL})
MOSQUITTO_DIR=$(basename -s .tar.gz ${MOSQUITTO_TARGZ_URL})

sudo apt-get install -y build-essential libtool m4 autoconf openssl libssl-dev libc-ares-dev uuid-dev
cd ${HOME_DIR}
wget ${MOSQUITTO_TARGZ_URL}
tar xzf ${MOSQUITTO_TARGZ_FILE}
rm ${MOSQUITTO_TARGZ_FILE}
cd ${MOSQUITTO_DIR}
make
sudo make install
rm -rf ${MOSQUITTO_DIR}
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib" >> $HOME_DIR/.bashrc

################################################################################
# TODO - git should be configured on host machine
# install RSMB from source
# See: http://git.eclipse.org/c/mosquitto/org.eclipse.mosquitto.rsmb.git
################################################################################
cd ${HOME_DIR}
git clone git://git.eclipse.org/gitroot/mosquitto/org.eclipse.mosquitto.rsmb.git
cd org.eclipse.mosquitto.rsmb/
cd rsmb/src/
make
cd ../../amqtdd/src/
make
echo "export PATH=\$PATH:$HOME_DIR/org.eclipse.mosquitto.rsmb/rsmb/src/:$HOME_DIR/org.eclipse.mosquitto.rsmb/amqtdd/src/" >> $HOME_DIR/.bashrc

echo '*** DONE! ***'
