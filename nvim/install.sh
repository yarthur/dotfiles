#!/usr/bin/env bash

echo -e "\n\nVim"
echo -e "=============================="

if test ! $(which nvim); then
	echo -e "Installing Neovim"
	brew install neovim/neovim/neovim python python3
	pip2 install neovim
	pip3 install neovim
	gem install neovim

	if [ ! -d ~/.config ]; then
		mkdir ~/.config
	fi

	ln -s ~/.dotfiles/nvim ~/.config/nvim
else
	brew upgrade neovim
fi

echo -e "Installing/Upgrading Plugins"
nvim +PlugInstall! +qall
