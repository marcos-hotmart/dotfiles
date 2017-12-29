#!/bin/bash

cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

install_homebrew() {
    if ! cmd_exists "brew"; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
    fi

    print_result $? "Install Homebrew"
}

main() {
    print_header "🍺  Installing Homebrew..."

    install_homebrew

    print_done

    print_header "🍻  Installing packages..."
    ./packages.sh

    print_done
}

main
