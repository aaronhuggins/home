#!/usr/bin/env sh

. ./src/util/exists.sh
. ./src/util/contains.sh

export DENO_INSTALL="$HOME/.deno"
if ! contains "$PATH" "$DENO_INSTALL"; then
	export PATH="$DENO_INSTALL/bin:$PATH"
fi

if ! exists -c deno; then
	echo "error: Deno must be installed at $DENO_INSTALL"
	exit 1
fi

deno_run () {
	deno run "$@" -
}
