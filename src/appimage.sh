#!/usr/bin/env sh

. ./src/util/define.sh
. ./src/util/gh_url.sh
. ./src/util/exists.sh

APPIMAGED_FILE=""
APPIMAGED_GLOB="$APPIMAGES_PATH/appimaged-*.AppImage"
APPIMAGES_PATH=~/Applications
NOTABLE_URL=$(gh_url notable/notable-insiders .AppImage)

mkdir -p "$APPIMAGES_PATH"

if ! exists -f "$APPIMAGED_GLOB"; then
	wget -c "https://github.com/$( \
		wget -q https://github.com/probonopd/go-appimage/releases/expanded_assets/continuous -O - | \
		grep "appimaged-.*-x86_64.AppImage" | \
		head -n 1 | \
		cut -d '"' -f 2 \
	)" -P "$APPIMAGES_PATH"
	APPIMAGED_FILE="$(find_file "$APPIMAGED_GLOB")"
	chmod +x "$APPIMAGED_FILE"
fi

if ! exists -s=user appimaged; then
	# Install daemon
	if [ "$APPIMAGED_FILE" = "" ]; then
		APPIMAGED_FILE="$(find_file "$APPIMAGED_GLOB")"
	fi
	"$APPIMAGED_FILE"
fi

curl -fsSL "$NOTABLE_URL" -o "$APPIMAGES_PATH/notable.AppImage"
