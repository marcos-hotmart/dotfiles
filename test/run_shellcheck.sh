#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../src/init/helpers.sh"

main() {
    find \
        ../test \
        ../src/macos \
        ../src/shell \
        -type f \
        ! -path '../src/shell/.curlrc' \
        ! -path '../src/shell/.inputrc' \
        ! -path '../src/macos/*.applescript' \
        ! -path '../src/macos/*.terminal' \
        -exec shellcheck \
            -e SC1090 \
            -e SC1091 \
            -e SC2155 \
            -e SC2164 \
        {} +
    print_result $? "run code through shellcheck"
}