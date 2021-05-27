#!/bin/bash

SYSTEM_TYPE=$(uname -s)
DOTS_CONFIG_DIR="$HOME/.config/subl/User"
MACOS_CONFIG_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    [[ -d "$MACOS_CONFIG_DIR" ]] && rm -rf "$MACOS_CONFIG_DIR"
    ln -s "$DOTS_CONFIG_DIR" "$MACOS_CONFIG_DIR"
fi
# TODO: linux and windows

echo "Sublime Text ✅"
