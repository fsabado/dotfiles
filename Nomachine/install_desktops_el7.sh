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
sudo yum --enablerepo=epel -y yum groupinstall cinnamon-desktop-environment

#Install Mate Desktop
sudo yum --enablerepo=epel -y groups install "MATE Desktop"

#Install Xfce
sudo yum -y install epel-release
sudo yum --enablerepo=epel -y groups install "Xfce"


#Others:
# LXDE
#
# Ubuntu 16.04
# apt-get install lxde-common
#
# Fedora 27
# dnf groupinstall lxde-desktop-environment
#
# OpenSuseLeap 42.2
# zypper -n in patterns-openSUSE-lxde
#
# Debian 9
# apt-get install lxde
#
# XFCE
#
# Ubuntu 16.04
# apt-get install xfce4
#
# Fedora 27
# dnf groupinstall xfce-desktop-environment
#
# CentOS 7
# yum install -y epel-release && yum groupinstall Xfce
#
# OpenSuseLeap 42.2
# zypper -n in patterns-openSUSE-xfce
#
# Debian 9
# apt-get install xfce4
#
# MATE
#
# Ubuntu 16.04
# apt-get install mate-desktop-environment
#
# Fedora 27
# dnf groupinstall mate-desktop-environment
#
# CentOS 7
# yum install epel-release && yum groupinstall mate
#
# OpenSuseLeap 42.2
# zypper -n in patterns-openSUSE-mate
#
# Debian 9
# apt-get install mate-desktop-environment
#
# UNITY
#
# Ubuntu 16.04
# apt-get install ubuntu-desktop
#
# GNOME
#
# Fedora 27
# dnf groupinstall gnome-desktop
#
# CentOS 7
# yum groupinstall gnome-desktop
#
# Debian 9
# apt-get install task-gnome-desktop
#
# KDE
#
# Ubuntu 16.04
# apt-get install plasma-desktop
#
# Fedora 27
# dnf groupinstall kde-desktop-environment
#
# CentOS 7
# yum groupinstall "KDE Plasma Workspaces”
#
# Debian 9
# apt-get install kde-plasma-desktop
#
# CINNAMON
#
# Ubuntu 16.04
# apt-get install cinnamon
#
# Fedora 27
# dnf groupinstall cinnamon-desktop-environment
#
# CentOS 7
# yum install epel-release && yum groupinstall cinnamon-desktop-environment
#
# OpenSuseLeap 42.2
# zypper install cinnamon
#
# Debian 9
# apt-get install task-cinnamon-desktop
