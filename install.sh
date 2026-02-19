#!/bin/bash
set -e

# Download to the current folder instead of /tmp to avoid permission errors
TEMP_DEB="./kotobee_installer.deb"
DEB_URL="https://github.com/youssef-pplo/kotobee-test/releases/download/v1.9.6/kotobee-author.deb"

echo "--- Starting Kotobee Author Installation ---"

# 1. Download with progress bar
echo "Downloading package (155MB)..."
# We removed 'sudo' from curl and changed destination to local folder
curl -L --progress-bar -o "$TEMP_DEB" "$DEB_URL"

# 2. Update and Install
echo "Installing..."
sudo apt-get update -qq
sudo apt-get install -y "$TEMP_DEB"

# 3. Clean up
rm -f "$TEMP_DEB"

echo "----------------------------------------------"
echo "✅ Done! Kotobee Author is installed."
echo "----------------------------------------------"
