#!/usr/bin/env sh

contains () {
	echo "$1" | grep "$2" > /dev/null 2>&1;
}
