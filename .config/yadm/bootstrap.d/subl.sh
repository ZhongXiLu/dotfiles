#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)
DOTS_CONFIG_DIR="$HOME/.config/subl/User"
MACOS_CONFIG_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
LINUX_CONFIG_DIR="$HOME/.config/sublime-text-3/Packages/User"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    [[ -d "$MACOS_CONFIG_DIR" ]] && rm -rf "$MACOS_CONFIG_DIR"
    [ -L "$MACOS_CONFIG_DIR" ] && rm "$MACOS_CONFIG_DIR"
    ln -s "$DOTS_CONFIG_DIR" "$MACOS_CONFIG_DIR"

elif [[ "$SYSTEM_TYPE" = "Linux" ]]; then
    [[ -d "$LINUX_CONFIG_DIR" ]] && rm -rf "$LINUX_CONFIG_DIR"
    [ -L "$LINUX_CONFIG_DIR" ] && rm "$LINUX_CONFIG_DIR"
    ln -s "$DOTS_CONFIG_DIR" "$LINUX_CONFIG_DIR"
fi
# TODO: windows?

echo "Sublime Text ✅"
