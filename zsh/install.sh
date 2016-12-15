#!/usr/bin/env bash

echo -e "\n\nZsh"
echo -e "=============================="

if [ ! -e "$HOME/.oh-my-zsh" ]; then
	echo -e "Installing Oh My Zsh"

	wgetTest=false

	if test ! $(which wget); then
		wgetTest=true
		brew install wget
	fi

	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

	if [ $wgetTest = true ]; then
		brew remove wget
	fi

	brew install zsh-completions
else
	echo -e "Updating Oh My Zsh"

	env ZSH=$ZSH sh $ZSH/tools/upgrade.sh

	brew upgrade zsh-completions
fi
