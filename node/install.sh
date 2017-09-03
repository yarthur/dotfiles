#!/usr/bin/env bash
source $HOME/.dotfiles/lib/brew.sh

node_modules="eslint grunt-cli jsonlint stylelint trash-cli wordflip"

echo -e "\n\nNode"
echo -e "=============================="

handle_taps "node"


if [ "/usr/local/lib/node_modules" ]; then
	echo -e "Removing global Node modules (for Hard Upgrade)."
	npm uninstall -g $node_modules
fi

echo -e "Installing global Node modules."
npm install -g $node_modules
