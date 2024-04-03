#!/bin/bash

# Define variables
VM_NAME="UbuntuServer2204"
RAM_SIZE_MB=10240  # 10 GB RAM in MB
HDD_SIZE_MB=102400  # 100 GB HDD in MB

# Create virtual machine
VBoxManage createvm --name "$VM_NAME" --ostype "Ubuntu_64" --register

# Configure virtual machine settings
VBoxManage modifyvm "$VM_NAME" --memory "$RAM_SIZE_MB" --vram 128 --cpus 2
VBoxManage modifyvm "$VM_NAME" --nic1 nat
VBoxManage modifyvm "$VM_NAME" --audio none
VBoxManage modifyvm "$VM_NAME" --boot1 dvd --boot2 disk --boot3 none --boot4 none

# Create and attach virtual hard disk
VBoxManage createmedium disk --filename "$VM_NAME.vdi" --size "$HDD_SIZE_MB"
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM_NAME.vdi"

# Attach Ubuntu Server ISO for installation
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium "ubuntu-22.04-live-server-amd64.iso"

# Start virtual machine (optional)
# VBoxManage startvm "$VM_NAME"
