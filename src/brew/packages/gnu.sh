#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

declare -a gnuArr=(
    "coreutils"
    "moreutils"
    "findutils"
    "binutils"
    "diffutils"
    "gnu-sed --with-default-names"
    "gnu-which --with-default-names"
    "gnu-tar --with-default-names"
    "gawk"
    "grep"
    "gzip"
    "screen"
    "wget"
    "gnupg"
    "tree"
)

install_gnutools() {
    echo "👽  Installing GNU tools..."
    for i in "${gnuArr[@]}"
    do
        brew install "$i" > /dev/null
        print_success "$i\n"
    done
    sleep .5
    print_done
}

install_gnutools