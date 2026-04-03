#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "GitHub CLI"
print "################################################################################"
print ""

if [ ! "$(readlink $XDG_CONFIG_HOME/gh)" = "$DOTFILES_HOME/gh" ]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh" "$XDG_CONFIG_HOME/gh"
fi

# Link this directory to ~/.config/git
if [ ! -h $XDG_CONFIG_HOME/gh ]; then
	print "Linking managed config."
	run_command ln -s "$DOTFILES_HOME/gh" "$XDG_CONFIG_HOME/gh"
fi

print "Install extensions."
run_command gh extension install dlvhdr/gh-dash
