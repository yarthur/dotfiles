#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

echo "Zsh"
echo $separator

zsh_path="$(which zsh)"

if brew ls --versions zsh 2>&1; then
	zsh_path="$(brew --prefix)/bin/zsh"
fi

if ! grep -q $zsh_path /etc/shells; then
	sudo echo $zsh_path >> /etc/shells
fi

if [ ! "$SHELL" = "$zsh_path" ]; then
	chsh -s $zsh_path
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "Installing Oh My Zsh"

	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
	
	echo [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]
	if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
		echo "Let's make sure our .zshrc file is linked up."
		mv $HOME/.zshrc.pre-oh-my-zsh $DOTFILES_HOME/backup
		sh -c $DOTFILES_LIB/link.sh
	fi		
else
	echo "Updating Oh My Zsh"
	env ZSH=$ZSH sh $ZSH/tools/upgrade.sh
fi
