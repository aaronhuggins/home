#!/usr/bin/env sh

# TODO: Everything. This is broken. Need to take completely different approach.

TEMP_EVDI_REPO="/etc/yum.repos.d/negativo17-fedora-multimedia.repo"

# Extensible Video Display Interface (DisplayLink)
curl -fsSL https://negativo17.org/repos/fedora-multimedia.repo -o $TEMP_EVDI_REPO

### EXTRACT evdi
uuid="ublue-akmods-slip"

docker create --name $uuid "ghcr.io/ublue-os/akmods:main-${RELEASE} bash"
docker cp $uuid:/rpms /tmp/akmods-rpms
docker rm -f $uuid

if cmd_exist rpm-ostree; then
	rpm-ostree install /tmp/akmods-rpms/ublue-os/ublue-os-akmods-addons*.rpm
	rpm-ostree install /tmp/akmods-rpms/kmods/*evdi*.rpm
else
	dnf -y install /tmp/akmods-rpms/ublue-os/ublue-os-akmods-addons*.rpm
	dnf -y install /tmp/akmods-rpms/kmods/*evdi*.rpm
fi

rm -f $TEMP_EVDI_REPO
