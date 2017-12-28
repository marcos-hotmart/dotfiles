#!/bin/bash

declare -r GITHUB_REPO="gretzky/dotfiles"
declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPO.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPO/tarball/master"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPO/master/src/utils/helpers.sh"

declare dotfilesDir="$HOME/dev/dotfiles"
declare skipQuestions=false

download() {
    local url="$1"
    local output="$2"

    if command -v "wget" &> /dev/null; then
        wget -qO "$output" "$url" &> /dev/null
        return $?
    fi

    return 1
}

download_dotfiles() {
    local tmpFile=""

    print_in_cyan "⏬ Downloading and extracting archive..."

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_TARBALL_URL" "$tmpFile"
    print_result $? "Download archive" "true"
    printf "\n"

    if ! $skipQuestions; then
        ask_for_confirmation "Do you want to store the dotfiles in '$dotfilesDir'?"

        if ! answer_is_yes; then
            dotfilesDir=""
            while [ -z "$dotfilesDir" ]; do
                ask "Specify another location for the dotfiles (path): "
                dotfilesDir="$(get_answer)"
            done
        fi

        while [ -e "$dotfilesDir" ]; do
            ask_for_confirmation "'$dotfilesDir' already exists, overwrite?"

            if answer_is_yes; then
                rm -rf "$dotfilesDir"
                break
            else
                dotfilesDir=""
                while [ -z "$dotfilesDir" ]; do
                    ask "Specify another location for the dotfiles (path): "
                dotfilesDir="$(get_answer)"
                done
            fi
        done

        printf "\n"

    else
        rm -rf "$dotfilesDir" &> /dev/null
    fi

    mkdir -p "$dotfilesDir"
    print_result $? "Create '$dotfilesDir'" "true"

    extract "$tmpFile" "$dotfilesDir"
    print_result $? "Extract archive" "true"

    rm -rf "$tmpFile"
    print_result $? "Remove archive"

    cd "$dotfilesDir/utils" \
        || return 1
}

download_utils() {
    local tmpFile=""
    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0
    return 1
}

extract() {
    local archive="$1"
    local outputDir="$2"

    if command -v "tar" &> /dev/null; then
        tar -zxf "$archive" --strip-components 1 -C "$outputDir"
        return $?
    fi

    return 1
}

verify_os() {
    declare -r MINIMUM_MACOS_VERSION="10.1"

    local os_name=""
    local os_version=""

    os_name="$(uname -s)"

    if [ "$os_name" == "Darwin" ]; then
        os_version="$(sw_vers -productVersion)"

        if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
            return 0
        else
            print_error "Sorry, this script is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
        fi

    else
        print_error "Sorry, this script is intended only for macOS"
    fi

    return 1
}

main() {
    echo "\n      ██            ██     ████ ██  ██
     ░██           ░██    ░██░ ░░  ░██
     ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
  ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░
 ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████
░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████
 ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░

  ▓▓▓▓▓▓▓▓▓▓
 ░▓ about  ▓ custom macOS configs
 ░▓ author ▓ sara federico <sarafederi.co>
 ░▓ code   ▓ http://github.com/gretzky/dotfiles
 ░▓ mirror ▓ https://git.io/vb7Ug
 ░▓▓▓▓▓▓▓▓▓▓
 ░░░░░░░░░░
"
    sleep 1
    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    if [ -x "helpers.sh" ]; then
        . "helpers.sh" || exit 1
    else
        download_utils || exit 1
    fi

    verify_os \
        || exit 1

    skip_questions "$@" \
        && skipQuestions=true

    ask_for_sudo

    printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
        || download_dotfiles

    ./init/create-dirs.sh
    ./init/create-symlinks.sh "$@"
    ./macos/setup.sh
    ./brew/setup.sh
    ./vim/setup.sh
    ./node/setup.sh

    if cmd_exists "git"; then
        if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then
            print_in_cyan "Initializing git repo in this folder..."
            ./init/init-git.sh "$DOTFILES_ORIGIN"
            print_done
        fi

        if ! $skipQuestions; then
            print_in_cyan "Updating this repo"
            ./init/update-dotfiles.sh
            print_done
        fi
    fi

    local P="\033[1;35m"
    local NC="\033[0m"
    echo "${P}✨  Dotfiles setup complete!${NC}"

    if ! $skipQuestions; then
        ./init/restart.sh
    fi
}

main "$@"