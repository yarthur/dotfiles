#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Bat"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/bat)" = "$DOTFILES_HOME/bat" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh" "$XDG_CONFIG_HOME/bat"
fi

if [[ ! -h $XDG_CONFIG_HOME/bat ]]; then
	print "Linking managed config."
	run_command ln -s "$DOTFILES_HOME/bat" "$XDG_CONFIG_HOME/bat"
fi
