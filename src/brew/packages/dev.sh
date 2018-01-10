#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

# devtools
declare -a toolsArr=(
    "ack"
    "rsync"
    "zsh"
    "git"
    "hub"
    "heroku"
    "node"
    "tmux"
    "vim --override-system-vi"
    "macvim --override-system-vim --custom-system-icons"
    "yarn"
    "rename"
    "openssh"
    "openssl"
    "sshrc"
    "mas"
    "ffmpeg"
    "imagemagick"
    "keychain"
    "awscli"
    "dark-mode"
    "speedtest-cli"
    "ssh-copy-id"
)

install_devtools() {
    echo "🤓  Installing devtools..."
    for i in "${toolsArr[@]}"
    do
        brew install "$i" > /dev/null
        print_success "$i\n"
    done
    sleep .5
    print_done
}

install_devtools