#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "GitHub CLI"
print "################################################################################"
print ""

print "Update GH Extensions"
run_command gh extension upgrade --all
