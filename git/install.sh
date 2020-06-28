#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi


echo "Git"
echo $separator

# If the git config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/git)" = "$DOTFILES_HOME/git" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/git
fi

# Link this directory to ~/.config/git
if [ ! -h $XDG_CONFIG_HOME/git ]; then
	ln -s $DOTFILES_HOME/git $XDG_CONFIG_HOME/git
fi
