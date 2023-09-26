#!/usr/bin/env sh

function define () {
	o=;
	while IFS="\n" read -r a;
	do o="$o$a"'
';
	done;
	eval "$1=\$o";
}
