#!/usr/bin/env bash
config_files="$HOME/.dotfiles"

echo -e "\n\nVim"
echo "=============================="

if [ ! -d ~/.config ]; then
	mkdir ~/.config
fi

# If the nvim config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $HOME/.config/nvim)" = "$($config_files/nvim)" ]; then
	$config_files/lib/backup.sh ~/.config/nvim
fi

# Link this directory to ~/.config/nvim
if [ ! -h $HOME/.composer ]; then
	ln -s $config_files/nvim $HOME/.config/nvim
fi

echo "Installing/Upgrading Plugins"

pip2 install -U neovim
pip3 install -U neovim
npm uninstall -g neovim && npm install -g neovim

nvim +PlugInstall! +PlugClean +qall
