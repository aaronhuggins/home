#!/usr/bin/env sh

find_file () {
	DIR="$(dirname "$1")"
	FILE="$(basename "$1")"
	find "$DIR" -name "$FILE" 2> /dev/null | grep -F '';
}

exists () {
	case $1 in
		-c)
			command -v "$2" > /dev/null 2>&1;
			;;
		-f)
			find_file "$2" > /dev/null 2>&1;
			;;
		-s)
			systemctl --no-pager list-units --type=service | grep "$2.service" > /dev/null 2>&1;
			;;
		-s=system)
			systemctl --no-pager list-units --type=service | grep "$2.service" > /dev/null 2>&1;
			;;
		-s=user)
			systemctl --no-pager --user list-units --type=service | grep "$2.service" > /dev/null 2>&1;
			;;
		*)
			find_file "$1" > /dev/null 2>&1;
			;;
	esac;
}
