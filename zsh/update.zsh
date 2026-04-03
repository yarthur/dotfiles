#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Zsh"
print "################################################################################"
print ""

antidote_dir="$ZDOTDIR/antidote"
plugins_txt="$ZDOTDIR/plugins.txt"
plugins_zsh="$XDG_CACHE_HOME/antidote/plugins.zsh"

print "Source Antidote."
run_command source "$antidote_dir/antidote.zsh"

print "Clone bundle(s) and generate the static load script."
antidote bundle <"$plugins_txt" >"$plugins_zsh"

print "Update antidote and its cloned bundles."
run_command antidote update

print "Source plugins."
run_command source "$plugins_zsh"
