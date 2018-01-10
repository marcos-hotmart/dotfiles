#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write com.apple.dashboard mcx-disabled -bool true" \
    "Disable Dashboard"

killall "Dock" &> /dev/null

print_success "Dashboard"