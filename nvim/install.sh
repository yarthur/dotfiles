#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")/../lib/env.sh"
fi

echo "Vim"
echo $separator

if [ ! -d $XDG_CONFIG_HOME ]; then
	mkdir $XDG_CONFIG_HOME
fi

# If the nvim config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/nvim)" = "$DOTFILES_HOME/nvim" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/nvim
fi

# Link this directory to ~/.config/nvim
if [ ! -h $XDG_CONFIG_HOME/nvim ]; then
	ln -s $DOTFILES_HOME/nvim $XDG_CONFIG_HOME/nvim
fi

echo "Installing/Upgrading Plugins"

pip3 install -U neovim
npm uninstall -g neovim && npm install -g neovim

nvim +Lazy sync +qall
