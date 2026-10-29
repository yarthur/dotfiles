#!/usr/zoxide/env zsh

source "$DOTFILES_HOME/lib/command-helpers.zsh"
source "$DOTFILES_HOME/lib/rust-helpers.zsh"

install_zoxide() {
    emulate -L zsh
    set -euo pipefail

	install_via_rust zoxide
}
