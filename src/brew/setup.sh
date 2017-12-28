#!/bin/bash

cd "$(dirname "$0")" \
    && . "../utils/helpers.sh"

install_homebrew() {
    if ! cmd_exists "brew"; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
    fi

    print_result $? "Homebrew"
}

opt_out_of_analytics() {
    local path=""

    path="$(get_homebrew_git_config_file_path)" \
        || return 1

    if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
        git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
    fi

    print_result $? "Homebrew (opt-out of analytics)"
}

main() {
    print_header "\n🍺  Installing Homebrew...\n"

    install_homebrew
    opt_out_of_analytics

    print_in_purple "\n✨  Done!\n"

    print_header "\n🍻  Installing packages...\n"
    ./brew.sh

    print_in_purple "\n✨  Done!\n"
}

main
