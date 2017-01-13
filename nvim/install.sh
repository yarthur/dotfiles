#!/usr/bin/env bash
source $HOME/.dotfiles/lib/brew.sh

brew_taps="python python3"

echo -e "\n\nVim"
echo "=============================="
handle_taps $brew_taps

if $(check_installed_taps "neovim"); then
	handle_taps "neovim"
else
	echo "Installing Neovim"
	brew install neovim/neovim/neovim
	pip2 install neovim
	pip3 install neovim
	gem install neovim

	if [ ! -d ~/.config ]; then
		mkdir ~/.config
	fi

	ln -s ~/.dotfiles/nvim ~/.config/nvim
fi

echo "Installing/Upgrading Plugins"

nvim +PlugInstall! +qall
