#!/usr/bin/env sh

. ./src/util/cmd_exist.sh
. ./src/vars/rpm_list.sh
. ./src/yum.sh

# resolve latest Tabby terminal RPM
TABBY_BASE_URL="https://github.com/Eugeny/tabby/releases/latest/download/"
function tabby_rpm_name () {
	curl -fsSL "${TABBY_BASE_URL}latest-x64-linux.yml" | grep \.rpm | head -1 | sed 's/.*url\: \(.*\.rpm\).*/\1/g';
}
TABBY_RPM_URL="${TABBY_BASE_URL}$(tabby_rpm_name)"

# Install Fedora RPMs
if cmd_exist rpm-ostree;
then
	eval "sudo rpm-ostree install --allow-inactive --idempotent --apply-live $RPM_LIST"
	eval "sudo rpm-ostree install --allow-inactive --idempotent --apply-live $TABBY_RPM_URL"
else
	eval "sudo dnf -y install $RPM_LIST"
	eval "sudo dnf -y install $TABBY_RPM_URL"
fi
