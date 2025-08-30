defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture ""
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write com.apple.frameworks.diskimages skip-verify -bool false
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool false
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool false
tmutil enable
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool false
brew analytics on
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write com.apple.Safari HomePage -string "https://scidsg.github.io/relaylove/"
defaults write com.apple.Finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.Finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.Finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.Finder WarnOnEmptyTrash -bool true
