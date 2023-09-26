#!/usr/bin/env sh

. ./src/util/define.sh
. ./src/me.sh
. ./src/work.sh

GITCONFIG_PATH="~/.gitconfig"
GITINCLUDE_PATH="~/.config/gitinclude"
GITDIR_ME="~/dev/me/"
GITDIR_WORK="~/dev/work/"
GITCONFIG=""
GITCONFIG_ME=""
GITCONFIG_WORK=""

define GITCONFIG << HEREDOC
[user]
	name = $ME_NAME

[includeIf \"gitdir:$GITDIR_ME\"]
	path = $GITINCLUDE_PATH/me

[includeIf \"gitdir:$GITDIR_WORK\"]
	path = $GITINCLUDE_PATH/work
HEREDOC

define GITCONFIG_ME << HEREDOC
[user]
	email = $ME_EMAIL
HEREDOC

define GITCONFIG_WORK << HEREDOC
[user]
	email = $WORK_EMAIL
HEREDOC

# Create directories
eval "mkdir -p $GITDIR_ME"
eval "mkdir -p $GITDIR_WORK"
eval "mkdir -p $GITINCLUDE_PATH"

# Create files
eval "echo \"$GITCONFIG\" > ${GITCONFIG_PATH}"
eval "echo \"$GITCONFIG_ME\" > $GITINCLUDE_PATH/me"
eval "echo \"$GITCONFIG_WORK\" > $GITINCLUDE_PATH/work"
