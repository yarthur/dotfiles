#!/usr/bin/env bash
source $HOME/.dotfiles/lib/brew.sh

node_modules="csslint eslint grunt-cli wordflip"

echo -e "\n\nNode"
echo -e "=============================="

handle_taps "node"


if [ "/usr/local/lib/node_modules" ]; then
	echo -e "Removing global Node modules (for Hard Upgrade)."
	npm uninstall -g $node_modules
fi

echo -e "Installing global Node modules."
npm install -g csslint eslint grunt-cli trash-cli wordflip
