#!/usr/bin/env sh

# shellcheck disable=SC2269
WORK_EMAIL="$WORK_EMAIL"

if [ "$WORK_EMAIL" = "" ]; then
	echo "Enter your work email:"
	read -r __email
	WORK_EMAIL="$__email"
fi

export WORK_EMAIL
