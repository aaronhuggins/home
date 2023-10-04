#!/usr/bin/env sh

. ./src/util/define.sh

. ./src/util/print.sh

BASHRC_APPEND=""

define BASHRC_APPEND << 'HEREDOC'
function if_eval () {
	command -v $1 &> /dev/null && eval "$("$@")";
}

USR_BASH_COMPLETIONS=~/.local/share/bash-completion/completions

[ -s "$USR_BASH_COMPLETIONS/git" ] && \. "$USR_BASH_COMPLETIONS/git"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

if_eval deno completions bash

if_eval npm completion

if_eval node --completion-bash

if_eval starship init bash
HEREDOC

USR_BASH_COMPLETIONS=~/.local/share/bash-completion/completions

mkdir -p "$USR_BASH_COMPLETIONS"

curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o "${USR_BASH_COMPLETIONS}/git"

print "$BASHRC_APPEND" >> ~/.bashrc
