#!/usr/bin/env sh

if [ "$EUID" != 0 ];
then
	sudo "$0" "$@"
	exit $?
fi
