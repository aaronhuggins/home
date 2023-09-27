#!/usr/bin/env sh

if [ x"$WORK_EMAIL" == "x" ];
then
	echo "Enter your work email:"
	read __email
	export WORK_EMAIL="$__email"
fi
