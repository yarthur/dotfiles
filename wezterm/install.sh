#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")/../lib/env.sh"
fi

echo "WezTerm"
echo $separator

if [ ! -d $XDG_CONFIG_HOME ]; then
	mkdir $XDG_CONFIG_HOME
fi

# If the wezterm config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/wezterm)" = "$DOTFILES_HOME/wezterm" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/wezterm
fi

# Link this directory to ~/.config/wezterm
if [ ! -h $XDG_CONFIG_HOME/wezterm ]; then
	ln -s $DOTFILES_HOME/wezterm $XDG_CONFIG_HOME/wezterm
fi
