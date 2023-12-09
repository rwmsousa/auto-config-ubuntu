#!/bin/bash

# Main script to configure an Ubuntu machine

# Check if the user has sudo privileges
if [ "$(id -u)" != "0" ]; then
  echo "This script needs to be executed with superuser privileges (sudo)."
  exit 1
fi

# Directory where the scripts are located
SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Execute individual scripts
$SCRIPTS_DIR/1.configure_system.sh
$SCRIPTS_DIR/2.install_essentials.sh
$SCRIPTS_DIR/3.install_applications.sh

# Clean up unnecessary packages after installation
sudo apt autoremove -y
sudo apt clean

echo "Configuration completed successfully!"
