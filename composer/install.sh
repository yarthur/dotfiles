#!/usr/bin/env bash

config_files="$HOME/.dotfiles"

echo -e "\n\nVim"
echo "=============================="

brew install composer

$config_files/lib/backup.sh ~/.composer

ln -s $config_files/composer $HOME/.composer

composer global update
