#!/usr/bin/env bash

config_files="$HOME/.dotfiles"

echo -e "\n\nComposer"
echo "=============================="

if test ! $(which composer); then
	echo -e "Installing Composer."
	brew install composer

	$config_files/lib/backup.sh ~/.composer

	ln -s $config_files/composer $HOME/.composer
fi

echo -e "Installing/Upgrading global Composer packages."
composer global update
