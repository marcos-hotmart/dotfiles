#!/usr/bin/env bash

# source utils
cd "$(dirname "$0")" \
    && . "../utils.sh"

declare -a npmArr=(
    "npm"
    "n"
    "yarn"
    "pure-prompt"
    "babel-cli"
    "electron"
    "exp"
    "ignite-cli"
    "react-native-cli"
    "serverless"
    "typescript"
    "ngrok"
    "gh-pages"
    "webpack"
    "create-react-app"
)

# fonts
install_npm_packages() {
    echo "📦  Installing global npm packages..."
    for i in "${npmArr[@]}"
    do
        npm i -g "$i" --silent
        print_success "$i installed\n"
    done
    sleep .5
    print_done
}

install_npm_packages
