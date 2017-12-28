#!/bin/bash

# source utils
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "helpers.sh"

create_dirs() {
    declare -a DIRS=(
        "$HOME/Downloads/torrents"
    )

    for i in "${DIRS[@]}"; do
        mkd "$i"
    done
}

main() {
    print_in_cyan "🗄  Creating directories..."
    create_dirs
    print_done
}

main