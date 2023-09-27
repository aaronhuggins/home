#!/usr/bin/env sh

. ./src/util/define.sh

RPM_LIST=""

define_flat RPM_LIST << 'HEREDOC'
akmods
flatpak
lcov
git
podman
podman-docker
code
vivaldi-stable
gnome-tweaks
distrobox
HEREDOC
