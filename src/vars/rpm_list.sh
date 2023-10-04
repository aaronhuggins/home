#!/usr/bin/env sh

. ./src/util/define.sh

# shellcheck disable=SC2269
RPM_LIST="$RPM_LIST"

if [ "$RPM_LIST" = "" ]; then
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
libcurl
firejail
shellcheck
HEREDOC
fi

export RPM_LIST
