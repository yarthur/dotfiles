#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Zsh"
print "################################################################################"
print ""

zsh_path="$(which zsh)"

if [[ "brew ls --versions zsh 2>&1" ]]; then
	zsh_path="$(brew --prefix)/bin/zsh"
fi

if ! grep -q $zsh_path /etc/shells; then
	print "Adding $zsh_path to /etc/shells."
	run_command "sudo echo $zsh_path >> /etc/shells"
fi

if [ ! "$SHELL" = "$zsh_path" ]; then
	print "Setting default shell to ZSH."
	run_command "chsh -s $zsh_path"
fi

if [[ ! "$(readlink $XDG_CONFIG_HOME/zsh)" = "$DOTFILES_HOME/zsh" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/zsh"
fi

if [[ ! -h $XDG_CONFIG_HOME/zsh ]]; then
	print "Linking managed config."
	run_command "ln -s $DOTFILES_HOME/zsh $XDG_CONFIG_HOME/zsh"
fi
