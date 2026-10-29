#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Dotfiles"
print "################################################################################"
print ""

print "Adding dotfiles to $XDG_BIN_HOME"

run_command "ln" "-sf" "$DOTFILES_HOME/bin/dotfiles" "$XDG_BIN_HOME"
