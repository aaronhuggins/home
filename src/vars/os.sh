#!/usr/bin/env sh
# shellcheck disable=SC2269

ARCH="$ARCH"
KERNEL="$KERNEL"
RELEASE="$RELEASE"
USER_ID="$USER_ID"

if [ "$ARCH" = "" ]; then
	ARCH="$(rpm -E '%_arch')"
fi

if [ "$KERNEL" = "" ]; then
	KERNEL="$(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
fi

if [ "$RELEASE" = "" ]; then
	RELEASE="$(rpm -E '%fedora')"
fi

if [ "$USER_ID" = "" ]; then
	USER_ID="$(id -u)"
fi

export ARCH
export KERNEL
export RELEASE
export USER_ID
