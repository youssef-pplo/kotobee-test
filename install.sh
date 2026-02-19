#!/bin/bash

# Exit if any command fails
set -e

# The specific link to your Release file
DEB_URL="https://github.com/youssef-pplo/kotobee-test/releases/download/v1.9.6/kotobee-author.deb"
TEMP_DEB="/tmp/kotobee-author.deb"

echo "--- Starting Kotobee Author Installation ---"

# 1. Download the .deb from GitHub Releases
echo "Downloading package from GitHub..."
curl -L -sS -o "$TEMP_DEB" "$DEB_URL"

# 2. Update package lists
echo "Updating system package lists..."
sudo apt-get update

# 3. Install the .deb (apt-get install handles the dependencies)
echo "Installing Kotobee Author..."
sudo apt-get install -y "$TEMP_DEB"

# 4. Clean up
echo "Cleaning up temporary files..."
rm -f "$TEMP_DEB"

echo "------------------------------------------"
echo "Done! You can now launch Kotobee Author."
