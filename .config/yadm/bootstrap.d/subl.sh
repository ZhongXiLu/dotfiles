#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)
DOTS_CONFIG_DIR="$HOME/.config/subl"
SUBL_CONFIG_DIR=""
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    SUBL_CONFIG_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages"
elif [[ "$SYSTEM_TYPE" = "Linux" ]]; then
    SUBL_CONFIG_DIR="$HOME/.config/sublime-text-3/Packages"
fi

if [ "$SYSTEM_TYPE" = "Darwin" ] || [ "$SYSTEM_TYPE" = "Linux" ]; then
    [[ -d "$SUBL_CONFIG_DIR/User" ]] && rm -rf "$SUBL_CONFIG_DIR"/User
    [ -L "$SUBL_CONFIG_DIR/User" ] && rm "$SUBL_CONFIG_DIR/User"
    ln -s "$DOTS_CONFIG_DIR/User" "$SUBL_CONFIG_DIR/User"
fi

echo "Sublime Text ✅"
