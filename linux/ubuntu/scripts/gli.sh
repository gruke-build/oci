#!/bin/bash -e
################################################################################
##  File:  gli.sh
##  Desc:  Installs GLI
##  General-purpose CI utilities and helpers.
################################################################################

# Source the helpers for use with the script
. /imagegeneration/installers/helpers/install.sh

gli_arch() {
  case "$(uname -m)" in
    'aarch64') echo 'arm64' ;;
    'x86_64') echo 'x64' ;;
    *) exit 1 ;;
  esac
}

# Download GLI
base_url="https://github.com/GreemDev/GLI/releases/latest/download"
filename="gli-linux-$(gli_arch)"
download_with_retries "${base_url}/${filename}" "/tmp" "gli"
# Install GLI
sudo install /tmp/gli /usr/bin/gli
