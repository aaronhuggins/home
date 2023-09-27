#!/usr/bin/env sh

. ./src/util/gnome_extension.sh

# Make Junction switcher the browser default
xdg-settings set default-web-browser re.sonny.Junction.desktop

gnome_extension dash-to-dock@micxgx.gmail.com -s
gnome_extension drive-menu@gnome-shell-extensions.gcampax.github.com -s
