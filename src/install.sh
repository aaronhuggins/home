#!/usr/bin/env sh

# Install command-line tools and interpreters
. ./src/cli_tools.sh

# Install Fedora RPMs
. ./src/rpms.sh

# Install Flathub repository and flatpak packages
. ./src/flatpak.sh

# Install Widevine for browsers
sudo ./src/widevine.sh /opt/vivaldi

# Install DisplayLink drivers
sudo ./src/evdi.sh
