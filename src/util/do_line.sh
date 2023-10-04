#!/usr/bin/env sh

do_line () {
	ARGS="${*}"
	while IFS=$(printf '\n\n') read -r a; do
		if [ x"$a" != "x" ]; then
			eval "$ARGS $a";
		fi;
	done;
}
