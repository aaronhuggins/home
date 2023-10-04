#!/usr/bin/env sh

# Install command-line tools and interpreters
NVM_VERSION=$(curl -Ls -o /dev/null -w '%{url_effective}' https://github.com/nvm-sh/nvm/releases/latest | sed 's#.*/##')
export PROFILE=/dev/null
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
export PROFILE=""
curl -fsSL https://deno.land/x/install/install.sh | sh
export FORCE=1
curl -fsSL https://starship.rs/install.sh | sh
unset FORCE
