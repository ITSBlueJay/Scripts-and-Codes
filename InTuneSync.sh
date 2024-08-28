#!/bin/bash

# Script to sync Mac device with Microsoft Intune

# Set the path to the Company Portal app (may need to adjust if installed elsewhere)
COMPANY_PORTAL="/Applications/Company Portal.app"

# Ensure the Company Portal app is installed
if [ ! -e "$COMPANY_PORTAL" ]; then
  echo "Error: Company Portal app not found. Please install it."
  exit 1
fi

# Check if the Company Portal app is currently running
if pgrep -x "Company Portal" > /dev/null; then
  # If it's running, try triggering a sync via AppleScript
  osascript -e 'tell application "Company Portal" to sync'

  echo "Sync initiated via Company Portal app."
else
  # If it's not running, launch the app (assuming it will trigger a sync on launch)
  open "$COMPANY_PORTAL"

  echo "Company Portal app launched (sync should initiate automatically)."
fi
