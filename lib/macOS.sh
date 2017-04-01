#!/usr/bin/env bash

##
# Set up macOS the way you like it.
#
# And by "you", I mean me.
#
##

echo "Updating/resetting macOS settings."

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs).
# Source: [erikh/hack.sh][]
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Automatically hide and show the Dock
# Source: [erikh/hack.sh][]
defaults write com.apple.dock autohide -bool true

# Show Path bar in Finder.
# Source: [erikh/hack.sh][]
defaults write com.apple.finder ShowPathbar -bool true

# Avoid creating .DS_Store files on network volumes
# Source: [erikh/hack.sh][]
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable snap-to-grid for desktop icons
# Source: [erikh/hack.sh][]
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Show hidden files by default
# Source: [nicknisi/dotfiles][]
defaults write com.apple.Finder AppleShowAllFiles -bool true


##
# Sources:
#
# [erickh/hack.sh]: https://gist.github.com/erikh/2260182
# [nicknisi/dotfiles]: https://github.com/nicknisi/dotfiles/blob/master/install/osx.sh
#
##
