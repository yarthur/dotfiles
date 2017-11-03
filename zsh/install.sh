#!/usr/bin/env bash
source $HOME/.dotfiles/lib/brew.sh

brew_taps="zsh-autosuggestions zsh-completions zsh-syntax-highlighting"

echo -e "\n\nZsh"
echo "=============================="

if [ ! "$HOME/.oh-my-zsh" ]; then
	echo "Installing Oh My Zsh"

	wgetTest=false

	if test ! $(which wget); then
		wgetTest=true
		brew install wget
	fi

	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

	if [ $wgetTest = true ]; then
		brew remove wget
	fi

else
	env ZSH=$ZSH sh $ZSH/tools/upgrade.sh
fi

handle_taps $brew_taps
