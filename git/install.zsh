#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Git"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/git)" = "$DOTFILES_HOME/git" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/git"
fi

if [[ ! -h $XDG_CONFIG_HOME/git ]]; then
	print "Linking managed config."
	run_command "ln -s $DOTFILES_HOME/git $XDG_CONFIG_HOME/git"
fi
