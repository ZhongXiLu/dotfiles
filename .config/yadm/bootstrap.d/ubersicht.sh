#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)

SIMPLE_BAR_FOLDER="$HOME/Library/Application Support/Übersicht/widgets/simple-bar"
SETTINGS_FILE="$SIMPLE_BAR_FOLDER/lib/settings.js"
THEMES_FILE="$SIMPLE_BAR_FOLDER/lib/styles/themes.js"
SPACEDUCK_THEME_FILE="$SIMPLE_BAR_FOLDER/lib/styles/themes/spaceduck.js"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    if [ ! -d "$SIMPLE_BAR_FOLDER" ]; then
        git clone https://github.com/Jean-Tinland/simple-bar "$SIMPLE_BAR_FOLDER"
    fi

    [[ -L "$SETTINGS_FILE" || -f "$SETTINGS_FILE" ]] && rm "$SETTINGS_FILE"
    ln "$HOME/.config/simple-bar/settings.js" "$SETTINGS_FILE"
    [[ -L "$THEMES_FILE" || -f "$THEMES_FILE" ]] && rm "$THEMES_FILE"
    ln "$HOME/.config/simple-bar/themes.js" "$THEMES_FILE"
    [[ -L "$SPACEDUCK_THEME_FILE" || -f "$SPACEDUCK_THEME_FILE" ]] && rm "$SPACEDUCK_THEME_FILE"
    ln "$HOME/.config/simple-bar/spaceduck.js" "$SPACEDUCK_THEME_FILE"

    # Hide default macOS menu bar
    defaults write $HOME/Library/Preferences/.GlobalPreferences.plist _HIHideMenuBar -bool true

    echo "simple-bar ✅"

    osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Übersicht.app", hidden:false}'
    echo "Übersicht ✅"
fi
