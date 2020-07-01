#!/usr/bin/env bash
if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

CODE_USER_DIR="$HOME/Library/Application Support/Code/User"

echo -e "\n\nVS Code"
echo $separator

if [ ! -d "$CODE_USER_DIR" ]; then
	echo "VS Code user directory doesn't seem to exist at $CODE_USER_DIR. Is it installed?"
	exit
fi

# Back up existing settings file (if it's not linked up already).
if [ ! "$(readlink "$CODE_USER_DIR/settings.json")" = "$DOTFILES_HOME/vscode/settings.json5" ]; then
	echo "Moving $CODE_USER_DIR/settings.json to $DOTFILES_HOME/backup/vscode."
	mkdir -p "$DOTFILES_HOME/backup/vscode"
	mv "$CODE_USER_DIR/settings.json" "$DOTFILES_HOME/backup/vscode"
fi

# Link the settings.json file.
if [ ! -h "$CODE_USER_DIR/settings.json" ]; then
	echo "Linking up $DOTFILES_HOME/vscode/settings.json5 to $CODE_USER_DIR/settings.json."
	ln -s "$DOTFILES_HOME/vscode/settings.json5" "$CODE_USER_DIR/settings.json"
fi

echo "Installing Extensions"
echo $separator
sh -c $DOTFILES_HOME/vscode/install-extensions.sh

