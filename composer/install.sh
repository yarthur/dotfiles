#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

echo -e "\n\nComposer"
echo $separator

# If the composer dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $HOME/.composer)" = "$DOTFILES_HOME/composer" ]; then
	$DOTFILES_LIB/backup.sh ~/.composer
fi

# Link this directory to ~/.composer
if [ ! -h $HOME/.composer ]; then
	ln -s $DOTFILES_HOME/composer $HOME/.composer
fi

echo -e "Installing/Upgrading global Composer packages."
composer global update
