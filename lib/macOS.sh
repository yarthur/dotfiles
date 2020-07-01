#!/usr/bin/env bash

################################################################################
#
# Set up macOS the way you like it.
# (And by "you", I mean me.)
#
# Many thanks to the following resources; I don't know what I'm dong on my own.
#    [erickh/hack.sh]: https://gist.github.com/erikh/2260182
#    [mathiasbynens/dotfiles]: https://github.com/mathiasbynens/dotfiles/blob/main/.macos
#    [nicknisi/dotfiles]: https://github.com/nicknisi/dotfiles/blob/master/install/macos.sh
#
################################################################################

echo "Updating/resetting macOS settings."

# Enable snap-to-grid for desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Show the ~/Library folder in Finder
chflags nohidden ~/Library

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Avoid creating .DS_Store files on network and USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Only show active apps in the dock.
defaults write com.apple.dock static-only -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the view modes: `clmv`, `icnv`, `glyv`, and `Nlsv
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Keep folders on top when sorting by name
defaults write com.apple.finder FXSortFoldersFirst -bool true

# Show icons for hard drives on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Show icons for servers on the desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Show Path bar in Finder.
defaults write com.apple.finder ShowPathbar -bool true

# Show icons for removable media on the desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Hide remaining battery time
defaults write com.apple.menuextra.battery ShowTime -string "NO"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Press Tab to highlight each (non-link) item on a web page.
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Press Tab to highlight each link on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Disable AutoFill
# Play with this later, this looks like something you want.
# defaults write com.apple.Safari AutoFillFromAddressBook -bool false
# defaults write com.apple.Safari AutoFillPasswords -bool false
# defaults write com.apple.Safari AutoFillCreditCardData -bool false
# defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs).
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save dialog by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show Bluetooth in menu bar.
defaults write NSStatusItem Visible com.apple.menuextra.bluetooth -bool true

# Show Volume in menu bar
defaults write com.apple.menuextra.volume -bool true

echo "NOTE: This will require sudo access."

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Sleep the display after 5 minutes
sudo pmset -a displaysleep 5

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a
#    power failure.
sudo pmset -a hibernatemode 0

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set machine sleep to 15 minutes on battery
sudo pmset -b sleep 15

echo "Done. Note that some/most of these changes require a logout/restart to take effect."
