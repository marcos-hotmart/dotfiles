#!/bin/bash

# source utils
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "helpers.sh"

# we only have one to make
# so let's just make it easy
#
# create_dirs() {
#     declare -a DIRS=(
#         "$HOME/Downloads/torrents"
#     )

#     for i in "${DIRS[@]}"; do
#         mkd "$i"
#     done
# }

main() {
    print_header "🗄  Creating directories..."
    mkdir $HOME/Documents/Torrents
    print_done
}

main