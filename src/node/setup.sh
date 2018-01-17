#!/usr/bin/env bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

declare -a npmArr=(
    "npm"
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
    "parcel-bundler"
)

# fonts
install_npm_packages() {
    print_header "⏬  Switching to latest stable node version"
    npm install -g --silent n
    n stable
    sleep .5
    print_done
    sleep 1
    print_header "📦  Installing global npm packages..."
    for i in "${npmArr[@]}"
    do
        npm i -g "$i" --silent
        print_success "$i installed\n"
    done
    sleep .5
    print_done
}

install_npm_packages
