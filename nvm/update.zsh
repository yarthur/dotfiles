#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"
#
# XDG-perfect NVM locations
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
export NVM_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/nvm"
export PROFILE=/dev/null

print ""
print ""
print "Node Version Manager"
print "################################################################################"
print ""

print "Update NVM"
run_command bash "$NVM_DIR/install.sh"

print "Updating (and setting) default Node (lts/*)."
run_command source "$NVM_DIR/nvm.sh"
run_command nvm install --default
