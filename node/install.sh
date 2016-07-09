#!/usr/bin/env bash

if test ! $(which node); then
	brew install node
fi

npm install -g bower csslint fuck-you grunt-cli gulp jscs jshint wordflip
