#!/bin/bash

# Update package lists
sudo apt update

# Install prerequisite packages
sudo apt install -y build-essential dkms linux-headers-$(uname -r)

# Add VirtualBox repository and key
sudo sh -c 'echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# Update package lists again
sudo apt update

# Install VirtualBox
sudo apt install -y virtualbox

# Install Extension Pack (optional)
# Replace <version> with the version of VirtualBox you installed
# Uncomment the line below to install the extension pack
# sudo wget https://download.virtualbox.org/virtualbox/<version>/Oracle_VM_VirtualBox_Extension_Pack-<version>.vbox-extpack -P /tmp
# sudo vboxmanage extpack install /tmp/Oracle_VM_VirtualBox_Extension_Pack-<version>.vbox-extpack
