#!/bin/bash

# source utils
cd "$(dirname "$0")" \
    && . "../../init/helpers.sh"

execute "defaults write -g AppleLanguages -array 'en'" \
    "Set language"

execute "defaults write NSGlobalDomain AppleLocale -string 'en_US@currency=USB'" \
    "Set currency to USD"

execute "defaults write NSGlobalDomain AppleMeasurementUnits -string 'Inches'" \
    "Set measurement units"

execute "defaults write NSGlobalDomain AppleMetricUnits -bool false" \
    "🇺🇸  Turn off Metric System 🇺🇸"

execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
    "Disable auto-correct"

print_success "Language & Region"