#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")/../lib/env.sh"
fi

echo "Bat"
echo $separator

if [ ! -d $XDG_CONFIG_HOME ]; then
	mkdir $XDG_CONFIG_HOME
fi

# If the nvim config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/bat)" = "$DOTFILES_HOME/bat" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/bat
fi

# Link this directory to ~/.config/nvim
if [ ! -h $XDG_CONFIG_HOME/bat ]; then
	ln -s $DOTFILES_HOME/bat $XDG_CONFIG_HOME/bat
fi
