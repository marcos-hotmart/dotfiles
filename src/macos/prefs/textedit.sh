#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write com.apple.TextEdit PlainTextEncoding -int 4 && \
         defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4" \
    "Open and save files as UTF-8 encoded"

execute "defaults write com.apple.TextEdit RichText 0" \
    "Use plain text mode for new documents"

killall "TextEdit" &> /dev/null

print_success "TextEdit"