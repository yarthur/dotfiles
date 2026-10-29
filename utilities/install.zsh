#!/usr/bin/env zsh

local utilities="$DOTFILES_HOME/utilities"

source "$DOTFILES_HOME/lib/command-helpers.zsh"
source "$utilities/_loader.zsh"

run_utility_action install

install_firacode_nerdfont() {
    emulate -L zsh
    set -euo pipefail

	local owner="ryanoasis"
	local repo="nerd-fonts"

    local font_dir="$HOME/Library/Fonts"

    mkdir -p "$font_dir"

    local version="$(github_latest_release $owner $repo)" || return

    local tmpdir
    tmpdir="$(mktemp -d)"

    (
        cd "$tmpdir"

        curl -fsSLO \
            "https://github.com/$owner/$repo/releases/download/${version}/FiraCode.zip"

        unzip -q FiraCode.zip

        find . -type f \( \
            -name '*.ttf' -o \
            -name '*.otf' \
        \) -exec cp {} "$font_dir/" \;
    )

    rm -rf "$tmpdir"

    print "✅ Installed FiraCode Nerd Font"
}
