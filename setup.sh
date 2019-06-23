#!/bin/bash

sudo systemctl enable ssh

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y build-essential git screen

##########################################################################
# Setup Bluetooth admin
cd $HOME
git clone https://github.com/OwnVoiceAssistant/raspi-btadmin.git
cd raspi-btadmin && make setup && make install

##########################################################################
# Put frequently updated files into memory to increase the lifespan of the sdcard
sudo tee -a /etc/fstab > /dev/null << EOL

# Put frequently updated files into memory to increase the lifespan of the sdcard
tmpfs    /tmp    tmpfs    defaults,noatime,nosuid,size=10m    0 0
tmpfs    /var/tmp    tmpfs    defaults,noatime,nosuid,size=5m    0 0
tmpfs    /var/log    tmpfs    defaults,noatime,nosuid,mode=0755,size=10m    0 0

EOL

##########################################################################
cd $HOME

sudo reboot
