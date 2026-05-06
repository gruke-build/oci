#!/bin/bash -e
################################################################################
##  File:  appimage.sh
##  Desc:  Installs AppImageTool
##  A low-level tool to generate an AppImage from an existing AppDir.
################################################################################

# Source the helpers for use with the script
. /imagegeneration/installers/helpers/install.sh
. /imagegeneration/installers/helpers/os.sh

ait_arch() {
  case "$(uname -m)" in
    'aarch64') echo 'aarch64' ;;
    'x86_64') echo 'x86_64' ;;
    *) exit 1 ;;
  esac
}

sudo apt update && sudo apt install -y zsync desktop-file-utils appstream

if isUbuntu22; then
  apt-get -yq install --no-install-recommends --no-install-suggests libfuse2
else
  apt-get -yq install --no-install-recommends --no-install-suggests libfuse2t64
fi

# Download AppImageTool from https://github.com/AppImage/appimagetool/releases/tag/continuous
base_url="https://github.com/AppImage/appimagetool/releases/download/continuous"
filename="appimagetool-$(ait_arch)"
download_with_retries "${base_url}/${filename}" "/tmp" "appimagetool.AppImage"
# Install AppImageTool
sudo install /tmp/appimagetool.AppImage /usr/bin/appimagetool