#!/usr/bin/env sh

. ./src/util/deno_run.sh
. ./src/vars/os.sh

gh_url () {
	gh_url_repo="$1"

	if [ "$2" = "" ]; then
		gh_url_file_end="$ARCH.rpm"
	else
		gh_url_file_end="$2"
	fi

	deno_run -A << JAVASCRIPT
		const res = await fetch("https://api.github.com/repos/$gh_url_repo/releases/latest")
		const { assets } = await res.json()
		const file_end = ("$gh_url_file_end").toLowerCase()
		let exit_code = 1
		for (const { name, browser_download_url } of assets) {
			if (name.toLowerCase().endsWith(file_end)) {
				console.log(browser_download_url)
				exit_code = 0
				break
			}
		}
		Deno.exit(exit_code)
JAVASCRIPT
}
