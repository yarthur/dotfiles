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

	if [ ! -d ~/.config ]; then
		mkdir ~/.config
	fi

	ln -s ~/.dotfiles/nvim ~/.config/nvim
fi

echo "Installing/Upgrading Plugins"

pip2 install -U neovim
pip3 install -U neovim
gem install neovim && gem cleanup

nvim +PlugInstall! +qall
