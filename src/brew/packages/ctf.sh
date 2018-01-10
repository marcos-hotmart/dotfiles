#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

declare -a ctfArr=(
    "aircrack-ng"
    "dns2tcp"
    "fcrackzip"
    "foremost"
    "hashpump"
    "hydra"
    "john"
    "knock"
    "nmap"
    "tcpflow"
    "tcpreplay"
    "tcptrace"
    "socat"
    "ucspi-tcp"
    "xpdf"
    "testssl"
    "zopfli"
    "pv"
)

install_ctfTools() {
    echo "🏳  Installing CTF tools..."
    for i in "${ctfArr[@]}"
    do
        brew install "$i" > /dev/null
        print_success "$i\n"
    done
    sleep .5
    print_done
}

install_ctfTools