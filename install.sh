#!/bin/bash

# Total download size: ~600MB
# Total installation size: ~2GB

set -e

# Step 1: Update and Upgrade System
echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

# Step 2: Essential System Components
echo "Installing essential system components..."
sudo apt install -y xorg lightdm
sudo apt install -y network-manager
sudo apt install -y pulseaudio pavucontrol
sudo apt install -y brightnessctl
sudo apt install -y bluetooth blueman

# Step 3: Core System Tools
echo "Installing core system tools..."
sudo apt install -y git vim
sudo apt install -y rsync
sudo apt install -y gparted
sudo apt install -y neofetch
sudo apt install -y timeshift
sudo apt install -y synaptic

# Step 4: Window Manager & Core Interface
echo "Installing window manager and interface tools..."
sudo apt install -y i3
sudo apt install -y picom
sudo apt install -y rofi
sudo apt install -y feh
sudo apt install -y polybar
sudo apt install -y dunst
sudo apt install -y lxappearance

# Step 5: Terminal and File Management
echo "Installing terminal and file management tools..."
sudo apt install -y alacritty
sudo apt install -y thunar ranger
sudo apt install -y xarchiver

# Step 6: Audio & Bluetooth
echo "Installing audio and Bluetooth tools..."
sudo apt install -y bluetooth blueman
sudo systemctl enable --now bluetooth
sudo apt install -y mpd ncmpcpp

# Step 7: Power Management
echo "Installing and enabling power management tools..."
sudo apt install -y tlp
sudo systemctl enable --now tlp

# Step 8: Multimedia Applications
echo "Installing multimedia applications..."
sudo apt install -y firefox-esr mpv
sudo apt install -y cheese
sudo apt install -y audacious
sudo apt install -y shotcut

# Step 9: Productivity Tools
echo "Installing productivity tools..."
sudo apt install -y mousepad
sudo apt install -y libreoffice

# Step 10: Utility Tools
echo "Installing utility tools..."
sudo apt install -y scrot clipman
sudo apt install -y aria2 yt-dlp
sudo apt install -y qbittorrent

# Step 11: Install FiraMono Nerd Font
unzip -q FiraMono.zip `.local/share/fonts` and `usr/share/fonts`

# Step 12: Refresh Font Cache
echo "Refreshing font cache..."
fc-cache -fv

echo "Minimal installation completed successfully."
