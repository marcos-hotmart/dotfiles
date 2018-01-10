#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

# rev up those fryers
update_upgrade() {
    echo "⏫  Updating & upgrading... (this may take a bit)"
    brew update > /dev/null
    # brew upgrade > /dev/null
    print_done
}


main() {
    print_header "🍺  Installing Homebrew packages\n\n"
    sleep 1
    update_upgrade
    ./packages/ba.sh
    ./packages/gnu.sh
    ./packages/dev.sh
    ./packages/ctf.sh
    ./packages/apps.sh
    ./packages/fonts.sh
    brew cleanup
    sleep .5
    print_done
}

main
