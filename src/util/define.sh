#!/usr/bin/env sh

define () {
	if [ "$1" = "-f" ] || [ "$1" = "--flatten" ]; then
		SEP="SPACE";
		VAR="$2";
	else
		SEP="LF";
		VAR="$1";
	fi;

	o=;
	while IFS=$(printf '\n\n') read -r a;
	do
		if [ "$SEP" = "LF" ]; then
			o="$o$a$IFS";
		else
			o="$o$a ";
		fi;
	done;

	eval "$VAR=\$o";
}
