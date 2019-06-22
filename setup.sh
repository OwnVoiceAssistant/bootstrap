#!/bin/bash

sudo touch /boot/ssh

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y build-essentials git screen

# Setup Bluetooth admin
cd $HOME
git clone https://github.com/OwnVoiceAssistant/raspi-btadmin.git

sudo reboot
