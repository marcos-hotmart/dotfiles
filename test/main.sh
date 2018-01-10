#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../src/init/helpers.sh"

# install shellcheck
brew install shellcheck

main() {
    ./run_shellcheck.sh
}

main