#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../utils/helpers.sh"

print_in_cyan "\n🛠  Setting macOS defaults\n"
sleep 2

sh ./set-defaults.sh

sleep 2
print_in_purple "\n✨  Done!\n"


