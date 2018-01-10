#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
    "Disable backswipe"

execute "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
    "Expand print dialog by default"

execute "defaults write com.google.Chrome DisablePrintPreview -bool true" \
    "Use system-native print preview dialog"

execute "defaults write com.google.Chrome ExtensionInstallSources -array 'https://gist.githubusercontent.com/' 'http://userscripts.org/*'" \
    "Allow installing user scripts via Github Gist / userscripts.org"


killall "Google Chrome" &> /dev/null

print_success "Chrome"