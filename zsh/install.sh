#!/usr/bin/env bash

echo -e "\n\nZsh"
echo "=============================="

if [ ! -e "$HOME/.oh-my-zsh" ]; then
	echo "Installing Oh-My-Zsh"

	brew install wget

	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

	brew remove wget
fi
