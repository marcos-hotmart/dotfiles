#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

print_header "\n💻  Set macOS preferences \n"

cd "$(dirname "${BASH_SOURCE[0]}")"

./close_system_prefs_panes.applescript

# Ask for admin password
sudo -v

./app_store.sh
./chrome.sh
./dashboard.sh
./dock.sh
./finder.sh
./iTerm.sh
./keyboard.sh
./lang_region.sh
./photos.sh
./safari.sh
./terminal.sh
./textedit.sh
./transmission.sh
./twitter.sh
./ui.sh
./ux.sh