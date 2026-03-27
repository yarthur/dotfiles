#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "TMux"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/tmux)" = "$DOTFILES_HOME/tmux" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/tmux"
fi

if [[ ! -h $XDG_CONFIG_HOME/tmux ]]; then
	print "Linking managed config."
	run_command "ln -s $DOTFILES_HOME/tmux $XDG_CONFIG_HOME/tmux"
fi
