#!/usr/bin/env sh

. ./src/util/define.sh
. ./src/util/do_line.sh
. ./src/util/print.sh

# shellcheck disable=SC2088
VSCODE_CONFIG_PATH="~/.config/Code/User"
VSCODE_CONFIG=""

define VSCODE_CONFIG << HEREDOC
{
	"window.menuBarVisibility": "compact",
	"window.titleBarStyle": "custom",
	"editor.fontFamily": "'FiraMono Nerd Font', 'monospace', monospace",
	"editor.fontLigatures": false,
	"editor.tabSize": 2,
	"editor.indentSize": "tabSize",
	"editor.insertSpaces": false,
	"editor.detectIndentation": false,
	"workbench.iconTheme": "material-icon-theme",
	"workbench.colorTheme": "Noctis Obscuro"
}
HEREDOC

VSCODE_CONFIG="$(print "$VSCODE_CONFIG" | sed 's/"/\\"/g')"

eval "mkdir -p $VSCODE_CONFIG_PATH"
eval "printf \"$VSCODE_CONFIG\" > ${VSCODE_CONFIG_PATH}/settings.json"
do_line code --force --install-extension << 'HEREDOC'
denoland.vscode-deno
esbenp.prettier-vscode
dbaeumer.vscode-eslint
PKief.material-icon-theme
mads-hartmann.bash-ide-vscode
liviuschera.noctis
HEREDOC
