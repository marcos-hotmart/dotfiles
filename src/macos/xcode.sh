cd "$(dirname "$0")" \
    && . "../init/helpers.sh"

buildXCode() {
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null

        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done

        print_result $? 'Install XCode Command Line Tools'

        sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
        print_result $? 'Make "xcode-select" dev directory point to Xcode'

        sudo xcodebuild -license
        print_result $? 'Agree with the XCode Command Line Tools license'

    fi
}

Y='\033[1;33m'
N='\033[0m'

setXcodePrefs() {
    sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
    print_success "Add iOS Simulator to Launchpad"

    sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"
    print_success "Add Watch Simulator to Launchpad"
}

read -n1 -r -p "${Y}🔑  Press any key to continue${NC}" KEY
if [ "$KEY" = '' ]; then
    print_header "🛠  Installing Xcode Command Line Tools..."
    buildXCode
    sleep 2
    print_success "XCode installed"
    print_in_blue "Setting Xcode preferences"
else
    exit 0
fi
