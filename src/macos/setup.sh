#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

print_header "\n🛠  Setting macOS defaults\n"
sleep 2

./set-defaults.sh
./xcode.sh

sleep 2
print_done


