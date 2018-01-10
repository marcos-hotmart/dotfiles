#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

## cask ##
install_cask() {
    echo "🍺  Tapping caskroom..."
    brew tap caskroom/cask > /dev/null
    print_done
}

declare -a appsArr=(
    "iterm2"
    "visual-studio-code"
    "the-unarchiver"
    "transmission"
    "google-chrome"
    "1password"
    "alfred"
    "heroku-toolbelt"
    "spotify"
    "flux"
    "etcher"
    "applepi-baker"
    "tunnelblick"
    "charles"
    "unetbootin"
    "rescuetime"
    "slack"
    "discord"
    "skype"
    "sketch"
    "sketch-toolbox"
    "eagle"
    "kicad"
    "kicad-extras"
    "ltspice"
    "expo-xde"
    "android-studio"
    "arduino"
    "steam"
    "macdown"
    "dropdbox"
    "spark"
    "neofetch"
    "htop"
    "vanilla"
    "endurance"
    "textual"
)

install_apps() {
    echo "💾  Installing apps (ask)..."
    install_cask
    for i in "${appsArr[@]}"
    do
        brew cask install "$i" > /dev/null
        print_success "$i\n"
    done
    sleep .5
    print_done
}

install_apps