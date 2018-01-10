#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false" \
    "Disable smart quotes"

execute "defaults write com.twitter.twitter-mac MenuItemBehavior -int 1" \
    "Show app window when clicking menu bar icon"

execute "defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true" \
    "Enable the hidden `Develop` menu"

execute "defaults write com.twitter.twitter-mac openLinksInBackground -bool true" \
    "Open links in the background"

execute "defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true" \
    "Allow closing `new tweet` window by pressing `esc`"

execute "defaults write com.twitter.twitter-mac HideInBackground -bool true" \
    "Hide app in background if its not the front-most window"

print_success "Twitter"