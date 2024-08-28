#!/bin/bash

# This script forces the installation of all available macOS updates.

# Displays usage information
usage() {
  echo "Usage: $0"
  echo "  This script will force install all available macOS updates."
  exit 1
}

# Display script usage information if no arguments are provided
if [[ $# -ne 0 ]]; then
  usage
fi

# Update the software update catalog
echo "Updating software update catalog..."
sudo softwareupdate --list

# Check for available updates
echo "Checking for available updates..."
available_updates=$(sudo softwareupdate --list)

if [[ "$available_updates" == *"No new software available"* ]]; then
  echo "Your macOS is up to date."
else
  echo "Forcing installation of all available updates..."
  sudo softwareupdate --install --all

  # Optionally, reboot the system if updates are installed
  echo "Rebooting the system..."
  sudo reboot
fi

