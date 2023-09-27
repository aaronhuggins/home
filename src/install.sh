#!/usr/bin/env sh

# Install command-line tools and interpreters
. ./src/cli_tools.sh

# Install Fedora RPMs
. ./src/rpms.sh

# Install Flathub repository and flatpak packages
. ./src/flatpak.sh

# Install Widevine for browsers
sudo sh ./src/widevine.sh /opt/vivaldi

# Install DisplayLink drivers
sudo sh ./src/evdi.sh
