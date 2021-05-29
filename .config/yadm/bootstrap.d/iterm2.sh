#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)
DOTS_CONFIG_DIR="$HOME/.config/iterm2"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTS_CONFIG_DIR"
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    echo "iTerm2 ✅"
fi
