#!/usr/bin/env sh

. ./src/vars/os.sh

if [ "$USER_ID" != "0" ]; then
	sudo "$0" "$@"
	exit $?
fi
