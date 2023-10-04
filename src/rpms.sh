#!/usr/bin/env sh

. ./src/util/exists.sh
. ./src/util/gh_url.sh
. ./src/vars/rpm_list.sh
. ./src/yum.sh

TABBY_RPM_URL="$(gh_url Eugeny/tabby x64.rpm)"

# Install Fedora RPMs
if exists -c rpm-ostree; then
	INST_CMD="sudo rpm-ostree install --allow-inactive --idempotent --apply-live"
else
	INST_CMD="sudo dnf -y install"
fi

eval "$INST_CMD $RPM_LIST"
eval "$INST_CMD $TABBY_RPM_URL"
