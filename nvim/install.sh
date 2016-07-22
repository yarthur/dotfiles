#!/usr/bin/env bash

echo -e "\n\nVim"
echo "=============================="

echo "Installing Vim"

# Dev Tools
brew install neovim/neovim/neovim

if [ ! -d ~/.config ]; then
	mkdir ~/.config
fi

ln -s ~/.dotfiles/nvim ~/.config/nvim

echo -e "Installing Plugins"

nvim +PlugInstall! +qall
