#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")/../lib/env.sh"
fi

echo "Tmux"
echo $separator

if [ ! -d $XDG_CONFIG_HOME ]; then
	mkdir $XDG_CONFIG_HOME
fi

# If the tmux config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/tmux)" = "$DOTFILES_HOME/tmux" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/tmux
fi

# Link this directory to ~/.config/tmux
if [ ! -h $XDG_CONFIG_HOME/tmux ]; then
	ln -s $DOTFILES_HOME/tmux $XDG_CONFIG_HOME/tmux
fi

# echo "Installing/Upgrading Plugins"
#
# pip3 install -U neovim
# Npm uninstall -g neovim && npm install -g neovim
#
# tmux +Lazy sync +qall
