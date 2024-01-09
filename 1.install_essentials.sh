#!/bin/bash

# Add execution permissions to the scripts
chmod +x ./1.install_essentials.sh
chmod +x ./2.install_applications.sh

# Add user to the docker group to avoid the need for sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# Add superadmin privileges to the user without restrictions
echo "$USER_NAME ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/90-custom-user

# Version control tools
sudo apt install -y git

# Prompt user for name and email
read -p "Enter your name (without spaces): " USER_NAME
read -p "Enter your email (for Git): " USER_EMAIL

# Configure Git with user information
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

# Update repositories
sudo apt update

# Install essential development packages
sudo apt install -y build-essential curl wget

# Install dconf-cli to import terminal configurations
sudo apt-get install -y dconf-cli

# Network tools
sudo apt install -y net-tools

# Text editor
sudo apt install -y vim

# Compression/decompression tools
sudo apt install -y unzip zip

# Process manager
sudo apt install -y htop

# Solaar (for Logitech Unifying devices)
sudo apt install -y solaar

# Psensor (Hardware temperature monitor)
sudo apt install -y psensor

# Tools for Python development
sudo apt install -y python3 python3-pip

# Tools for JavaScript/Node.js development
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs npm

# Docker
sudo apt install -y docker.io

# Docker Compose
sudo apt install -y docker-compose
