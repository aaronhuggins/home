#!/usr/bin/env sh

export ARCH="$(rpm -E '%_arch')"
export KERNEL="$(rpm -q "${KERNEL_NAME}" --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
export RELEASE="$(rpm -E '%fedora')"
