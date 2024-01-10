#!/bin/bash

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
xdg-settings set default-web-browser google-chrome.desktop

# Version control tools
sudo apt install -y git

# Prompt user for name and email
read -p "Enter your name (without spaces): " USER_NAME
read -p "Enter your email (for Git): " USER_EMAIL

# Configure Git with user information
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git config --list

# Install xclip (to copy SSH key to clipboard)
sudo apt-get install -y xclip

# Generate SSH key
yes | ssh-keygen -t ed25519 -C "$USER_EMAIL" -f ~/.ssh/id_ed25519 -N ''
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
echo "SSH key copied to clipboard. Add it to your GitHub account."
open https://github.com/settings/keys
read -p "ATTENTION!!! Press [Enter] key after adding the SSH key to your GitHub account..."

# Install essential development packages
sudo apt install -y build-essential curl wget

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


# Install Zsh
sudo apt install -y zsh
zsh --version

# Set Zsh as the default shell
sudo chsh -s $(which zsh)

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Oh-My-Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Install Oh-My-Zsh theme - Spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install Fira Code font
sudo apt install -y fonts-firacode

# Install Hyper terminal
sudo apt install -y gdebi
wget -O $HOME/hyper.deb https://releases.hyper.is/download/deb
sudo gdebi -n $HOME/hyper.deb

# Set Hyper as the default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50

# Install Hyper plugins
sudo sed -i 's/plugins: \[\]/plugins: \["hyperpower", "hyperterm-paste", "hyperterm-tabs", "hyper-statusline", "hyper-dnd-tabs", "hyper-blink", "hypercwd"\]/' $HOME/.hyper.js

# Replace the content of .hyper.js
cp .hyper.txt $HOME/.hyper.js

# Replace the content of .zshrc
cp .zshrc.txt $HOME/.zshrc

# Apply Zsh changes
source $ZSH/oh-my-zsh.sh

# Postman
sudo snap install postman

# DBeaver
sudo snap install dbeaver-ce

# Install Visual Studio Code
sudo snap install --classic code

# Tools for JavaScript/Node.js development
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Add user to the docker group to avoid the need for sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# Install Docker
sudo apt install -y docker.io

# Docker Compose
sudo apt install -y docker-compose

# Clean up unnecessary packages after installation
sudo apt autoremove -y
sudo apt clean

# Update repositories
sudo apt update

echo "Configuration completed successfully!"
