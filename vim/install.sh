#!/usr/bin/env bash

echo -e "\n\nVim"
echo "=============================="

echo "Installing Vim"

# Dev Tools
brew install macvim --override-system-vim


echo -e "Installing Plugins"

vim +PlugInstall! +qall
