##--** create a non-root user with sudo privileges
adduser usercondor1017

##**add the user to the sudo group
usermod -aG sudo usercondor1017

--**verify sudo privileges
sudo ls /root

--**optional customize sudo config
sudo visudo