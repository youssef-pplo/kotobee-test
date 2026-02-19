#!/bin/bash

# Exit if any command fails
set -e

# The specific link to your Release file
DEB_URL="https://github.com/youssef-pplo/kotobee-test/releases/download/v1.9.6/kotobee-author.deb"
TEMP_DEB="/tmp/kotobee-author.deb"

echo "----------------------------------------------"
echo "   Starting Kotobee Author Installation       "
echo "----------------------------------------------"

# 1. Check for curl
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Installing curl first..."
    sudo apt-get update && sudo apt-get install -y curl
fi

# 2. Download with a progress bar
# -L follows redirects (required for GitHub)
# -# shows a simple progress bar instead of the complex table
echo "Downloading Kotobee Author (155MB)..."
curl -L -# -o "$TEMP_DEB" "$DEB_URL"

# 3. Update and Install
echo ""
echo "Updating system package lists..."
sudo apt-get update -qq

echo "Installing Kotobee Author and dependencies..."
# -y assumes 'yes' to prompts
sudo apt-get install -y "$TEMP_DEB"

# 4. Clean up
echo "Cleaning up..."
rm -f "$TEMP_DEB"

echo "----------------------------------------------"
echo "✅ Installation Complete!                     "
echo "You can find Kotobee Author in your app menu. "
echo "----------------------------------------------"
