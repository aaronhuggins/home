#!/usr/bin/env sh

. ./src/util/print.sh

GNOME_VERSION=""

# Silent install, but requires user interaction unless at next reboot/login
# gnome_extension UUID [OPTION:-i=interactive,-s=silent]
gnome_extension () {
	UUID=$1
	FLAG=$2

	if [ "$GNOME_VERSION" = "" ]; then
		GNOME_VERSION="$(gnome-shell --version | sed 's/.* \([0-9]\+\).*/\1/g')"
	fi

	BASE_URL="https://extensions.gnome.org/download-extension"
	EXT_URL="$BASE_URL/$UUID.shell-extension.zip?shell_version=$GNOME_VERSION"
	EXT_FILE="/tmp/$UUID.zip"

	curl -fSL "$EXT_URL" -o "$EXT_FILE"
	gnome-extensions install --force "$EXT_FILE"

	if [ "$FLAG" = "-s" ]; then
		print "Gnome extension $UUID requires manual intervention at next reboot or login.\n"
	else
		if ! gnome-extensions list | grep "$UUID" > /dev/null 2>&1; then
			busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s "$UUID"
		fi
		gnome-extensions enable "$UUID"
	fi
	rm "$EXT_FILE"
}
