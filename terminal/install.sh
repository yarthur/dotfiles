#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti

tic $DOTFILES_HOME/terminal/xterm-256color-italic.terminfo
