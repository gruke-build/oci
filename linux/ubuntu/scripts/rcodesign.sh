#!/bin/bash -e
################################################################################
##  File:  gli.sh
##  Desc:  Installs rcodesign
##  Allows codesigning Mac binaries on non-Mac platforms.
################################################################################

# Source the helpers for use with the script
. /imagegeneration/installers/helpers/install.sh

# Download apple-platform-rs release archive
url=$(curl -s https://api.github.com/repos/indygreg/apple-platform-rs/releases/latest | jq -r ".assets[].browser_download_url|select(contains(\"unknown-linux-musl\") and contains(\"$(uname -m)\") and contains(\".tar.gz\"))")
download_with_retries "$url" "/tmp" "apple-platform-rs.tar.gz"
tar -xzvf /tmp/apple-platform-rs.tar.gz --wildcards '*/rcodesign' --strip-components=1
# Install
chmod +x rcodesign
sudo install rcodesign /usr/bin/rcodesign

# Cleanup
rm /tmp/apple-platform-rs.tar.gz
