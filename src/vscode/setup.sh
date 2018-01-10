#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

print_header "Installing VSCode Extensions"

setup_vscode() {
    declare -a EXTENSIONS=(
        "EditorConfig.EditorConfig"
        "Orta.vscode-jest"
        "PKief.material-icon-theme"
        "Zignd.html-css-class-completion"
        "akamud.vscode-theme-onedark"
        "ms-python.python"
        "msjsdiag.debugger-for-chrome"
        "ms-vscode.cpptools"
        "dbaeumer.vscode-eslint"
        "eg2.tslint"
        "PeterJausovec.vscode-docker"
        "xabikos.JavaScriptSnippets"
        "vsmobile.vscode-react-native"
        "esbenp.prettier-vscode"
        "christian-kohler.path-intellisense"
        "DavidAnson.vscode-markdownlint"
        "robinbentley.sass-indented"
        "christian-kohler.npm-intellisense"
        "formulahendry.auto-rename-tag"
        "formulahendry.auto-rename-tag"
        "waderyan.gitblame"
        "WakaTime.vscode-wakatime"
        "donjayamanne.git-extension-pack"
        "naumovs.color-highlight"
        "shyykoserhiy.vscode-spotify"
        "kisstkondoros.vscode-codemetrics"
        "xabikos.ReactSnippets"
        "EQuimper.react-native-react-redux"
        "timothymclane.react-redux-es6-snippets"
        "jeremyrajan.vscode-lebab"
        "wayou.vscode-todo-highlight"
        "dzannotti.vscode-babel-coloring"
    )

    for i in "${EXTENSIONS[@]}"; do
        code --install-extension "$i"
    done
}

print_done