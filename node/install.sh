#!/usr/bin/env bash

echo -e "\n\nNode"
echo -e "=============================="

if test $(which node); then
	echo -e "Removing global Node modules (for Hard Upgrade)."
	npm uninstall -g csslint eslint grunt-cli wordflip
else
	echo -e "Installing Node."
	brew install node
fi

echo -e "Installing global Node modules."
npm install -g csslint eslint grunt-cli trash-cli wordflip
