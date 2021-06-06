#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)
ZIP_FILENAME="JetBrainsMono-2.225.zip"

if [[ "$SYSTEM_TYPE" = "Linux" && ! -f "/usr/share/fonts/JetBrainsMono-Regular.ttf" ]]; then
    wget -q "https://download.jetbrains.com/fonts/$ZIP_FILENAME"
    unzip -oq "$ZIP_FILENAME"
    sudo mv fonts/ttf/JetBrainsMono-*.ttf /usr/share/fonts/
    rm -rf fonts
    rm -rf AUTHORS.txt
    rm -rf OFL.txt
    rm "$ZIP_FILENAME"
    echo "JetBrainsMono ✅"
fi
