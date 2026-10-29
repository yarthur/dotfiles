#!/usr/bin/env zsh

source "$DOTFILES_HOME/lib/command-helpers.zsh"

install_jq() {
	emulate -L zsh
	set -euo pipefail

	local owner="jqlang"
	local repo="jq"
	local bin="jq"

	local opt_home="${XDG_OPT_HOME:-$HOME/.local/opt}"
	local install_dir="$opt_home/$repo"
	local bin_dir="$HOME/.local/bin"

	if [[ -d "$bin_dir/$bin" ]]; then
		print "✅ $repo already installed: $($bin --version)"
		return 0
	fi

	mkdir -p "$install_dir" "$bin_dir"

	local version="$(github_latest_release $owner $repo)" || return

	local binary

	case "$(uname -m)" in
		arm64)
			binary="jq-macos-arm64"
			;;
		x86_64)
			binary="jq-macos-amd64"
			;;
		*)
			print -u2 "Unsupported architecture: $(uname -m)"
			return 1
			;;
	esac

	curl -fsSL \
		"https://github.com/$owner/$repo/releases/download/${version}/${binary}" \
		-o "$install_dir/$bin"

	chmod +x "$install_dir/$bin"

	ln -sf \
		"$install_dir/$bin" \
		"$bin_dir/$bin"

	print "✅ ${repo} installed: $($bin --version)"
}
