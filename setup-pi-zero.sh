#!/bin/bash
set -e

# OH MY YEASSSSSSHHHHHH
sudo apt install -y zsh curl git python3 python3-pip

# Install sensors project
path=projects/miflora-sensors
mkdir -p ${path}
git clone https://github.com/springdo/miflora-sensors.git ${path}
cd ${path}
pip3 install -r requirements.txt
sudo setcap 'cap_net_raw,cap_net_admin+eip' ~/.local/lib/python3.7/site-packages/bluepy/bluepy-helper

# fix hostname and change pswd
sudo vi /etc/hostname
passwd

# OH MY YEASSSSSSHHHHHH
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sudo reboot