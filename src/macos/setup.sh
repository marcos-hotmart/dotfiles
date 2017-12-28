#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

print_header "\n🛠  Setting macOS defaults\n"
sleep 2

./set-defaults
./xcode

sleep 2
print_in_purple "\n✨  Done!\n"


