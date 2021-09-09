#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)

SIMPLE_BAR_FOLDER="$HOME/Library/Application Support/Übersicht/widgets/simple-bar"
SETTINGS_FILE="$SIMPLE_BAR_FOLDER/lib/settings.js"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    if [ ! -d "$SIMPLE_BAR_FOLDER" ]; then
        git clone https://github.com/Jean-Tinland/simple-bar "$SIMPLE_BAR_FOLDER"
    fi

    # Configure simple-bar to use external config file
    sed -i "" 's/externalConfigFile\: false/externalConfigFile\: true/g' "$SETTINGS_FILE"

    # Hide default macOS menu bar
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist _HIHideMenuBar -bool true

    echo "simple-bar ✅"

    osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Übersicht.app", hidden:false}'
    echo "Übersicht ✅"
fi
