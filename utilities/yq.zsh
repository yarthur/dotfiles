#!/usr/bin/env zsh

source "$DOTFILES_HOME/lib/command-helpers.zsh"

install_yq() {
	emulate -L zsh
	set -euo pipefail

	local owner="mikefarah"
	local repo="yq"
	local bin="yq"

	if command -v $bin >/dev/null 2>&1; then
		print "✅ $repo already installed: $($bin --version)"
		return 0
	fi

	local opt_home="${XDG_OPT_HOME:-$HOME/.local/opt}"
	local install_dir="$opt_home/$repo"
	local bin_dir="$HOME/.local/bin"

	mkdir -p "$install_dir" "$bin_dir"

	local version="$(github_latest_release $owner $repo)" || return

	local binary

	case "$(uname -m)" in
		arm64)
			binary="yq_darwin_arm64"
			;;
		x86_64)
			binary="yq_darwin_amd64"
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

	print "✅ Installed: $($bin --version)"
}

