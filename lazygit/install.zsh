#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Lazygit"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/lazygit)" = "$DOTFILES_HOME/lazygit" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/lazygit"
fi

if [[ ! -h $XDG_CONFIG_HOME/lazygit ]]; then
	print "Linking managed config."
	run_command "ln -s $DOTFILES_HOME/lazygit $XDG_CONFIG_HOME/lazygit"
fi
i
