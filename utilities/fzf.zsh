#!/usr/bin/env zsh

source "$DOTFILES_HOME/lib/command-helpers.zsh"

install_fzf() {
    emulate -L zsh
    set -euo pipefail

	local owner="junegunn"
	local repo="fzf"
	local bin="fzf"

	if command -v $bin >/dev/null 2>&1; then
		print "✅ $repo already installed: $($bin --version)"
		return 0
	fi

    local opt_home="${XDG_OPT_HOME:-$HOME/.local/opt}"
    local install_dir="$opt_home/$repo"
    local bin_dir="$HOME/.local/bin"

    mkdir -p "$install_dir" "$bin_dir"

    local version
    version="$(
        github_latest_release $owner $repo
    )"

    [[ -n "$version" ]] || {
        print -u2 "Unable to determine $repo version"
        return 1
    }

    # fzf tags look like: v0.73.1
    local version_no_v="${version#v}"

    local archive

    case "$(uname -m)" in
        arm64)
            archive="$repo-${version_no_v}-darwin_arm64.tar.gz"
            ;;
        x86_64)
            archive="$repo-${version_no_v}-darwin_amd64.tar.gz"
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

        install -m 755 \
            fzf \
            "$install_dir/$repo"
    )

    rm -rf "$tmpdir"

    ln -sf \
        "$install_dir/$bin" \
        "$bin_dir/$bin"

    print "✅ Installed: $($bin --version)"
}

