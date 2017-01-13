#!/usr/bin/env bash
source $HOME/.dotfiles/lib/brew.sh

brew_taps="diff-so-fancy git git-flow"

echo -e "\n\nGit"
echo -e "=============================="

handle_taps $brew_taps
