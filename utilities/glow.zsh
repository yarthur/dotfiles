#!/usr/bin/env zsh

source "$DOTFILES_HOME/lib/command-helpers.zsh"

install_glow() {
	emulate -L zsh
	set -euo pipefail

	local owner="charmbracelet"
	local repo="glow"
	local bin="glow"

	local install_dir="$XDG_OPT_HOME/$repo"

	if [[ -d "$XDG_BIN_HOME/$bin" ]]; then
		print "✅ $repo already installed: $($bin --version)"
		return 0
	fi

	mkdir -p "$XDG_OPT_HOME" "$XDG_BIN_HOME"

	local version="$(github_latest_release $owner $repo)" || return

	local archive

	case "$(uname -m)" in
		arm64|aarch64)
			archive="glow_${version#v}_Darwin_arm64.tar.gz"
			;;
		x86_64)
			archive="glow_${version#v}_Darwin_x86_64.tar.gz"
			;;
		*)
			print -u2 "Unsupported architecture: $(uname -m)"
			return 1
			;;
	esac

	local tmpdir="$(mktemp -d)"

	(
		cd "$tmpdir"

		curl -fsSLO \
			"https://github.com/$owner/$repo/releases/download/${version}/${archive}"

		tar xzf "$archive"

		print "$install_dir"

		mv \
			${repo}_*/ \
			"$install_dir"

		print "B"
	)

	rm -rf "$tmpdir"

	ln -sf \
		"$install_dir/$bin" \
		"$XDG_BIN_HOME/$bin"

	print "✅ $repo installed: $($bin --version)"
}
