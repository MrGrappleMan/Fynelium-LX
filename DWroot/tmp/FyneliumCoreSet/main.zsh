variable dfwrt = "defaults write"

dfwrt /Library/Preferences/com.apple.loginwindow DesktopPicture ""
dfwrt com.apple.LaunchServices LSQuarantine -bool false
dfwrt com.apple.frameworks.diskimages skip-verify -bool false
dfwrt com.apple.frameworks.diskimages skip-verify-locked -bool false
dfwrt com.apple.frameworks.diskimages skip-verify-remote -bool false
dfwrt -g NSAutomaticSpellingCorrectionEnabled -bool true
dfwrt NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
dfwrt NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
dfwrt com.apple.Safari HomePage -string "https://scidsg.github.io/relaylove/"
dfwrt com.apple.Finder ShowHardDrivesOnDesktop -bool true
dfwrt com.apple.Finder ShowExternalHardDrivesOnDesktop -bool true
dfwrt com.apple.Finder ShowRemovableMediaOnDesktop -bool true
dfwrt com.apple.Finder ShowMountedServersOnDesktop -bool true
dfwrt com.apple.Finder WarnOnEmptyTrash -bool true
dfwrt com.apple.finder "FXEnableExtensionChangeWarning" -bool false
dfwrt /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool NO
tmutil enable
brew analytics on
pmset -b sleep 2
