#!/usr/bin/env bash
config_files="$HOME/.config/dotfiles"

echo -e "\n\nComposer"
echo "=============================="

# If the composer dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $HOME/.composer)" = "$config_files/composer" ]; then
	$config_files/lib/backup.sh ~/.composer
fi

# Link this directory to ~/.composer
if [ ! -h $HOME/.composer ]; then
	ln -s $config_files/composer $HOME/.composer
fi

echo -e "Installing/Upgrading global Composer packages."
composer global update
