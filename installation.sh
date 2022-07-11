#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./installation.sh" 2>&1
  exit 1
fi

# Update System
dnf update -y

# Enable RPM Fusion
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
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
