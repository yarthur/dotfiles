#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $DOTFILES_HOME/terminal/$TERM.terminfo
tic $TERM.terminfo

tic -o $HOME/.terminfo $DOTFILES_HOME/terminal/xterm-256color.terminfo

file=$DOTFILES_HOME/terminal/Profiles.json 
target=$HOME/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json

if (! [ -h "$target" ]); then
	echo "Creating link for YarthTerm"
	ln -s $file "$target"
fi
