#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

# bash 4
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

bash_init() {
    install_bash
    use_bash
}

bash_init