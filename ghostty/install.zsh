#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Ghostty"
print "################################################################################"
print ""

if [ ! "$(readlink $XDG_CONFIG_HOME/ghostty)" = "$DOTFILES_HOME/ghostty" ]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/ghostty"
fi

if [ ! -h $XDG_CONFIG_HOME/ghostty ]; then
	print "Linking managed config."
	run_command "ln -s $DOTFILES_HOME/ghostty $XDG_CONFIG_HOME/ghostty"
fi
