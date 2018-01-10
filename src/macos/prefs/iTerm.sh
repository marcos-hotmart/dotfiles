#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
    "Don't display the annoying prompt when quitting iTerm"

killall "iTerm" &> /dev/null

print_success "iTerm"