#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false" \n
    "Save to disk instead of iCloud by default"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
         defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
   "Avoid creating '.DS_Store' files on network or USB volumes"

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
    "Require password immediately after into sleep or screen saver mode"

execute "defaults write -g NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write com.apple.finder FXInfoPanesExpanded -dict && \
        General -bool true && \
        OpenWith -bool true && \
        Privileges -bool true" \
    "Expand 'General', 'Open With', and 'Privileges' file panes by default"

execute "defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array '/Volumes'" \
    "Use `sudo mdutil -i off '/Volumes/foo'`` to stop indexing any volume (Spotlight)"

execute "defaults write -g NSWindowResizeTime -float 0.001" \
    "Accelerated playback when adjusting the window size."

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'Sputnik' && \
         sudo scutil --set ComputerName 'sputnik' && \
         sudo scutil --set HostName 'sputnik' && \
         sudo scutil --set LocalHostName 'sputnik'" \
    "Set computer name"

execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
            sudo defaults write \"\${domain}\" dontAutoLoad -array \
                '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
                '/System/Library/CoreServices/Menu Extras/Volume.menu'
         done \
            && sudo defaults write com.apple.systemuiserver menuExtras -array \
                '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
                '/System/Library/CoreServices/Menu Extras/AirPort.menu' \
                '/System/Library/CoreServices/Menu Extras/Battery.menu' \
                '/System/Library/CoreServices/Menu Extras/Clock.menu'
        " \
    "Hide Time Machine and Volume icons from the menu bar"

execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
    "Prevent Time Machine from prompting to use new hard drives as backup volume"

execute "defaults write com.apple.BluetoothAudioAgent 'Apple Bitpool Min (editable)' -int 40" \
    "Increase Bluetooth headphone/headset sound quality"

execute "sudo systemsetup -setcomputersleep Off > /dev/null" \
    "SLEEP IS FOR THE WEAK"