#!/usr/bin/env zsh

local utilities="$DOTFILES_HOME/utilities"

install_zellij() {
	emulate -L zsh
	set -euo pipefail

	local owner="zellij-org"
	local repo="zellij"
	local bin="zellij"

	local opt_home="${XDG_OPT_HOME:-$HOME/.local/opt}"
	local install_dir="$opt_home/$repo"
	local bin_dir="$HOME/.local/bin"

	mkdir -p "$install_dir" "$bin_dir"

	local version
	version="$(github_latest_release $owner $repo)" || return 1

	local archive

	case "$(uname -m)" in
		arm64)
			archive="zellij-aarch64-apple-darwin.tar.gz"
			;;
		x86_64)
			archive="zellij-x86_64-apple-darwin.tar.gz"
			;;
		*)
			print -u2 "Unsupported architecture: $(uname -m)"
			return 1
			;;
	esac

	local tmpdir
	tmpdir="$(mktemp -d)"

	(
		cd "$tmpdir"

		curl -fsSLO \
			"https://github.com/$owner/$repo/releases/download/${version}/${archive}"

		tar xzf "$archive"

		print $bin
		print $install_dir

		install -m 755 \
			"$bin" \
			"$install_dir/$bin"
	)

	rm -rf "$tmpdir"

	ln -sf \
		"$install_dir/$bin" \
		"$bin_dir/$bin"

	print "✅ Installed: $($bin --version)"
}
