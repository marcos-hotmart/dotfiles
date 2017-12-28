#!/bin/bash

# source utils
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../init/helpers.sh"

install_plugins() {
    declare -r VUNDLE_DIR="$HOME/.vim/plugins/Vundle.vim"
    declare -r VUNDLE_GIT_REPO_URL="https://github.com/VundleVim/Vundle.vim.git"

    execute \
        "rm -rf '$VUNDLE_DIR' \
            && git clone --quiet '$VUNDLE_GIT_REPO_URL' '$VUNDLE_DIR' \
            && printf '\n' | vim +PluginInstall +qall" \
        "Install plugins" \
        || return 1
}

update_plugins() {
    execute \
    "vim +PluginUpdate +qall" \
    "Update plugins"
}

main() {
    print_header "Setting up Vim"

    printf "\n"

    install_plugins
    update_plugins
    print_done
}

main