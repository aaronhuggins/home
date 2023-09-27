#!/usr/bin/env sh

. ./src/vars/flatpak_list.sh

# Install Flathub repository and flatpak packages
flatpak remote-add --if-not-exists --prio=10 flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --title="Fedora Flatpaks" fedora oci+https://registry.fedoraproject.org

eval "flatpak install -y --or-update flathub $FLATPAK_LIST"
