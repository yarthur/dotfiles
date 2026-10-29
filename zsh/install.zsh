#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"
source "$DOTFILES_HOME/lib/link.zsh"

install_antidote() {
	emulate -L zsh
	set -e

	local antidote_home="${XDG_DATA_HOME:-$HOME/.local/share}/antidote"
	local repo="https://github.com/mattmc3/antidote.git"
	local bundle_dir="$XDG_CACHE_HOME/antidote"

	if [[ -d "$antidote_home/.git" ]]; then
		print "Updating Antidote..."
		run_command git -C "$antidote_home" pull --ff-only
	else
		print "Installing Antidote..."
		run_command mkdir -p "${antidote_home:h}"
		run_command git clone --depth=1 "$repo" "$antidote_home"
	fi

	run_command source "$antidote_home/antidote.zsh"

	if [[ ! -d "$bundle_dir" ]]; then
		run_command mkdir -p "$bundle_dir"
	fi

	antidote bundle < "$ZDOTDIR/plugins.txt" > "$bundle_dir/plugins.zsh"
}

print ""
print ""
print "Zsh"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/zsh)" = "$DOTFILES_HOME/zsh" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh" "$XDG_CONFIG_HOME/zsh"
fi

if [[ ! -h $XDG_CONFIG_HOME/zsh ]]; then
	print "Linking managed config."
	run_command ln -s "$DOTFILES_HOME/zsh" "$XDG_CONFIG_HOME/zsh"
fi

install_antidote

link "$DOTFILES_HOME/zsh"
