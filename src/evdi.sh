#!/usr/bin/env sh

. ./src/util/cmd_exist.sh

### !!! REQUIRES SUDO !!! ###
if [ "$EUID" != 0 ];
then
	sudo "$0" "$@"
	exit $?
fi

. ./src/vars/os.sh

TEMP_EVDI_REPO="/etc/yum.repos.d/negativo17-fedora-multimedia.repo"

# Extensible Video Display Interface (DisplayLink)
curl -fsSL https://negativo17.org/repos/fedora-multimedia.repo -o $TEMP_EVDI_REPO

### BUILD evdi (succeed or fail-fast with debug output)
export CFLAGS="-fno-pie -no-pie"

if cmd_exist rpm-ostree;
then
	rpm-ostree install --allow-inactive --idempotent akmod-evdi-*.fc${RELEASE}.${ARCH}
else
	dnf -y install akmod-evdi-*.fc${RELEASE}.${ARCH}
fi

akmods --force --kernels "${KERNEL}" --kmod evdi

modinfo /usr/lib/modules/${KERNEL}/extra/evdi/evdi.ko.xz > /dev/null \
	|| (find /var/cache/akmods/evdi/ -name \*.log -print -exec cat {} \; && exit 1)

rm -f $TEMP_EVDI_REPO

unset CFLAGS
