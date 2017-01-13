#!/usr/bin/env bash
config_files="$HOME/.dotfiles"

source $config_files/lib/brew.sh


echo -e "\n\nComposer"
echo "=============================="

if $(check_installed_taps "composer"); then
	echo "Upgrading Composer"
	brew upgrade --cleanup "composer"
else
	echo -e "Installing Composer."
	brew install composer

	$config_files/lib/backup.sh ~/.composer

	ln -s $config_files/composer $HOME/.composer
fi

echo -e "Installing/Upgrading global Composer packages."
composer global update
