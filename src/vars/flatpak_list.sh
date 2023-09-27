#!/usr/bin/env sh

. ./src/util/define.sh

FLATPAK_LIST=""

define_flat FLATPAK_LIST << 'HEREDOC'
com.belmoussaoui.Authenticator
com.discordapp.Discord
com.getpostman.Postman
com.github.KRTirtho.Spotube
com.github.tchx84.Flatseal
com.github.xournalpp.xournalpp
com.google.Chrome
com.mattjakeman.ExtensionManager
com.slack.Slack
im.riot.Riot
org.fedoraproject.MediaWriter
org.gimp.GIMP
org.gnome.baobab
org.gnome.Boxes
org.gnome.Calculator
org.gnome.Calendar
org.gnome.clocks
org.gnome.Extensions
org.gnome.font-viewer
org.gnome.Logs
org.gnome.TextEditor
org.gnome.Weather
org.mozilla.firefox
org.mozilla.Thunderbird
org.onlyoffice.desktopeditors
org.signal.Signal
org.videolan.VLC
re.sonny.Junction
HEREDOC
