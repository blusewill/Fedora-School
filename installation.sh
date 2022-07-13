#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./installation.sh" 2>&1
  exit 1
fi

# Asking for Username for Config File

echo Please Type your username
read username
echo "your username is $username"
echo Installation is going to Start in 10 Seconds if this is not your username please press CTRL+C
sleep 10


# Update System
dnf update -y


# Enable RPM Fusion
dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install git
dnf install git -y

# Install sddm
dnf install sddm -y 

# Install KDE Plasma
dnf install plasma-dekstop -y

# Install Kitty (Terminal Emulator)
dnf install kitty -y

# Install Dolphin (File Manager)

dnf install dolphin -y

# Install Gwenview (Image Viewer)
dnf install gwenview -y

# Install Arandr 

dnf install arandr -y

# Install Mousepad (Something like notepad)

dnf install mousepad -y

# Install Libreoffice (Open Source Office Suite)

dnf install libreoffice -y

#Drawing Application

# Krita

dnf install krita -y

# GIMP

# dnf install gimp

# Music/Video Player

# VLC

#dnf install vlc -y

# Celluloid

dnf install celluloid -y

# Web Broswer

# Install Firefox

# dnf install Firefox -y

# Install Google Chrome

#dnf install fedora-workstation-repositories -y
#dnf config-manager --set-enabled google-chrome
#dnf install google-chrome-stable -y

# Install Brave
dnf install dnf-plugins-core -y
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
dnf install brave-browser -y

#Copy Config File
cp -rf /home/$username/fedora-school/dotconfig/* /home/$username/.config/
cp -rf /home/$username/Fedora-School/dotconfig/* /home/$username/.config/


#Install sddm theme (simplicity-theme)
git clone https://gitlab.com/isseigx/simplicity-sddm-theme
cp -rf ./simplicity-sddm-theme/simplicity /usr/share/sddm/themes
rm /etc/sddm.conf
mv /home/$username/fedora-school/config/sddm.conf /etc/sddm.conf
mv /home/$username/Fedora-School/config/sddm.conf /etc/sddm.conf


#Enable Graphical Mode Boot

systemctl set-default graphical.target
