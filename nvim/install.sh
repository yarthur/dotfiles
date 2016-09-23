#!/usr/bin/env bash

echo -e "\n\nVim"
echo -e "=============================="

if test ! $(which nvim); then
	echo -e "Installing Neovim"
	brew install neovim/neovim/neovim

	if [ ! -d ~/.config ]; then
		mkdir ~/.config
	fi

	ln -s ~/.dotfiles/nvim ~/.config/nvim
fi

echo -e "Installing/Upgrading Plugins"
nvim +PlugInstall! +qall
