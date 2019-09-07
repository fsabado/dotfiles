#!/bin/bash

#Install Lxde
#sudo yum -y install lxqt-session
#Not working

#Install Gnome Desktop
sudo yum -y groups install "GNOME Desktop"

#Install KDE
sudo yum -y groups install "KDE Plasma Workspaces"

#Install Cinnamon Desktop
sudo yum -y install epel-release
sudo yum --enablerepo=epel -y install cinnamon*

#Install Mate Desktop
sudo yum --enablerepo=epel -y groups install "MATE Desktop"

#Install Xfce
sudo yum --enablerepo=epel -y groups install "Xfce"
