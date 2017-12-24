#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../utils/helpers.sh"

# rev up those fryers
update_upgrade() {
    echo "⏫  Updating & upgrading... (this may take a bit)"
    brew update > /dev/null
    # brew upgrade > /dev/null
    print_done
}

# bash 4
# make sure to add
# `/usr/local/bin/bash` to `/etc/shells`
# before running `chsh`
install_bash() {
    echo "🖋  Installing Bash 4..."
    brew install bash > /dev/null
    brew install bash-completion > /dev/null
    brew install homebrew/completions/brew-cask-completions > /dev/null
    print_done
}

# now use bash4
use_bash() {
    echo "🏎  Initializing Bash 4..."
    if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
        echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
        chsh -s /usr/local/bin/bash;
    fi;
    print_done
}

# devtools
declare -a toolsArr=(
    "coreutils"
    "moreutils"
    "findutils"
    "gnu-sed --with-default-names"
    "ack"
    "fzf"
    "grep"
    "gawk"
    "nmap"
    "gnupg"
    "wget --with-iri"
    "zsh"
    "git"
    "hub"
    "heroku"
    "node"
    "tmux"
    "tree"
    "vim"
    "yarn"
    "rename"
    "openssh"
    "openssl"
    "sshrc"
    "thefuck"
    "terminal-notifier"
    "mas"
    "ffmpeg"
    "imagemagick"
)

install_tools() {
    echo "👽  Installing devtools..."
    for i in "${toolsArr[@]}"
    do
        brew install "$i" > /dev/null
        print_success "$i\n"
    done
    sleep .5
    print_done
}

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
    "applepi-baker"
    "tunnelblick"
    "unetbootin"
    "rescuetime"
    "slack"
    "discord"
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
    "spark"
    "istat-menus"
    "bartender"
    "neofetch"
)

install_apps() {
    echo "💾  Installing apps..."
    for i in "${appsArr[@]}"
    do
        brew cask install "$i" > /dev/null
        print_success "$i\n"
    done
    sleep .5
    print_done
}

declare -a fontsArr=(
    "font-hack"
    "font-anonymous-pro"
    "font-nexa"
    "font-nunito"
    "font-source-code-pro"
)

# fonts
install_fonts() {
    echo "📰  Installing fonts..."
    for i in "${fontsArr[@]}"
    do
        brew cask install "$i" > /dev/null
        print_success "$i"
    done
    sleep .5
    print_done
}

main() {
    print_in_cyan "🍺  Installing Homebrew packages\n\n"
    sleep 1
    update_upgrade
    install_bash
    use_bash
    install_tools
    install_cask
    install_apps
    install_fonts
    brew cleanup
    sleep .5
    print_done
}

main
