#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"
source "$DOTFILES_HOME/lib/rust-helpers.zsh"

install_delta() {
  emulate -L zsh
  set -euo pipefail

  install_via_rust git-delta

  print "✅ Delta installed: $(delta --version)"
}

print ""
print ""
print "Git"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/git)" = "$DOTFILES_HOME/git" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh" "$XDG_CONFIG_HOME/git"
fi

if [[ ! -h $XDG_CONFIG_HOME/git ]]; then
	print "Linking managed config."
	run_command ln -s "$DOTFILES_HOME/git" "$XDG_CONFIG_HOME/git"
fi

if [[ ! -d "$HOME/.local/opt/delta" ]]; then
	print "Installing Delta pager"
	run_command install_delta
fi
