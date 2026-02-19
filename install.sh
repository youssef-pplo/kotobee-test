#!/bin/bash



TEMP_DEB="./kotobee_installer.deb"

DEB_URL="https://github.com/youssef-pplo/kotobee-test/releases/download/v1.9.6/kotobee-author.deb"



echo "--- Starting Kotobee Author Installation ---"



# 1. Download

echo "Downloading package (155MB)..."

curl -L --progress-bar -o "$TEMP_DEB" "$DEB_URL"



# 2. Update (Allowing it to fail if other repos are broken)

echo "Refreshing package lists (ignoring unrelated errors)..."

sudo apt-get update -qq || echo "Warning: Some repositories failed to update, but we will try to install anyway."



# 3. Install

echo "Installing Kotobee Author..."

# Using 'sudo apt-get install -f' after helps fix any missing dependency issues

sudo apt-get install -y "$TEMP_DEB" || sudo apt-get install -f -y



# 4. Clean up

rm -f "$TEMP_DEB"



echo "----------------------------------------------"

echo "✅ Done! Search for Kotobee in your apps."

echo "----------------------------------------------"
