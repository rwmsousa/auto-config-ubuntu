#!/bin/bash

# Google Chrome
sudo apt install -y google-chrome-stable

# Postman
sudo snap install postman

# DBeaver
sudo snap install dbeaver-ce

# Install Visual Studio Code
sudo snap install --classic code

# Open VSCode for the first time
code &

# Wait for 10 seconds
sleep 10

# Automatically close VSCode
pkill code

# Install Zsh
sudo apt install -y zsh
zsh --version

# Set Zsh as the default shell
chsh -s $(which zsh)

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Oh-My-Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Install Oh-My-Zsh theme - Spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install Oh-My-Zsh theme - Dracula
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
cd .. && rm -rf gnome-terminal

# Install Oh-My-Zsh theme - Hyper
git clone https://github.com/zeit/hyper-oh-my-zsh.git ~/.oh-my-zsh/custom/themes/hyper

# Install Fira Code font
sudo apt install -y fonts-firacode

# Install Hyper terminal
sudo apt install -y gdebi
wget -O $HOME/hyper.deb https://releases.hyper.is/download/deb
sudo gdebi -n $HOME/hyper.deb

# Set Hyper as the default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50

# Open the installed Hyper and close the current terminal
hyper && exit

# Install Hyper plugins
sudo sed -i 's/plugins: \[\]/plugins: \["hyperpower", "hyperterm-paste", "hyperterm-tabs", "hyper-statusline", "hyper-dnd-tabs", "hyper-blink", "hypercwd"\]/' $HOME/.hyper.js

# Replace the content of .hyper.js
cp .hyper.txt $HOME/.hyper.js

# Replace the content of .zshrc
cp .zshrc.txt $HOME/.zshrc

# Apply Zsh changes
source $ZSH/oh-my-zsh.sh

# Reopen the terminal
pkill Hyper && hyper

# Set the default font for the terminal to Fira Code
gsettings set org.gnome.desktop.interface monospace-font-name "Fira Code Regular 12"
