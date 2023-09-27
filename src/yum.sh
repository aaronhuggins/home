#!/usr/bin/env sh

. ./src/util/define.sh

# Microsoft VS Code
sudo curl -fsSL https://packages.microsoft.com/yumrepos/vscode/config.repo -o /etc/yum.repos.d/vscode-yum.repo

# Vivaldi Browser
sudo curl -fsSL https://repo.vivaldi.com/stable/vivaldi-fedora.repo -o /etc/yum.repos.d/vivaldi-fedora.repo
