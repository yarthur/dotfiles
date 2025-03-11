#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi


echo "GitHub CLI"
echo $separator

# If the git config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/gh)" = "$DOTFILES_HOME/gh" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/gh
fi

# Link this directory to ~/.config/git
if [ ! -h $XDG_CONFIG_HOME/gh ]; then
	ln -s $DOTFILES_HOME/gh $XDG_CONFIG_HOME/gh
fi
