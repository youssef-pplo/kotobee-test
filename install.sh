#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the download URL for your deb file
DEB_URL="https://kotobee.com/kotobee.deb"
TEMP_DEB="/tmp/kotobee.deb"

echo "Downloading Kotobee..."
curl -sS -o "$TEMP_DEB" "$DEB_URL"

echo "Installing Kotobee and checking for dependencies..."
# Running apt update ensures we can grab any missing dependencies
apt-get update
# Installing via apt-get (instead of dpkg) handles dependencies automatically
apt-get install -y "$TEMP_DEB"

echo "Cleaning up..."
rm -f "$TEMP_DEB"

echo "Kotobee has been successfully installed!"
