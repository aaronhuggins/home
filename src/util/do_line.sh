#!/usr/bin/env sh

function do_line () {
	while IFS=$'\n' read -r a;
	do
		if [ x"$a" != "x" ];
		then
			eval "$@ $a";
		fi
	done;
}
