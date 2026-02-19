#!/bin/bash
set -e

# Use a unique temp file name to avoid permission clashes
TEMP_DEB="/tmp/kotobee_$(date +%s).deb"
DEB_URL="https://github.com/youssef-pplo/kotobee-test/releases/download/v1.9.6/kotobee-author.deb"

echo "--- Starting Kotobee Author Installation ---"

# 1. Download - adding 'sudo' here ensures we can write to /tmp without error 23
echo "Downloading package (155MB)..."
sudo curl -L --progress-bar -o "$TEMP_DEB" "$DEB_URL"

# 2. Install
echo "Installing..."
sudo apt-get update -qq
sudo apt-get install -y "$TEMP_DEB"

# 3. Clean up
sudo rm -f "$TEMP_DEB"

echo "✅ Done! You can now launch Kotobee Author."
