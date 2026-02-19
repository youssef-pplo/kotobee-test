#!/bin/bash
set -e

DEB_URL="https://github.com/youssef-pplo/kotobee-test/releases/download/v1.9.6/kotobee-author.deb"
TEMP_DEB="/tmp/kotobee-author.deb"

echo "Downloading Kotobee Author..."
# Using --progress-bar specifically for better visibility
curl -L --progress-bar -o "$TEMP_DEB" "$DEB_URL"

echo "Installing package..."
sudo apt-get update -qq
sudo apt-get install -y "$TEMP_DEB"

rm -f "$TEMP_DEB"
echo "Success!"
