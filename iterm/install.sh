#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $DOTFILES_HOME/terminal/$TERM.terminfo
tic $TERM.terminfo

tic -o $HOME/.terminfo $DOTFILES_HOME/terminal/xterm-256color.terminfo

echo "Mapping preferences to $DOTFILES_HOME/iterm/preferences directory."

# Specify the preferences directory for iTerm
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES_HOME/iterm/preferences"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
