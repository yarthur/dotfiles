#!/usr/bin/env bash
if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

echo "Ghostty"
echo $separator

# If the ghostty config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/ghostty)" = "$DOTFILES_HOME/ghostty" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/ghostty
fi

# Link this directory to ~/.config/ghostty
if [ ! -h $XDG_CONFIG_HOME/ghostty ]; then
	ln -s $DOTFILES_HOME/ghostty $XDG_CONFIG_HOME/ghostty
fi
