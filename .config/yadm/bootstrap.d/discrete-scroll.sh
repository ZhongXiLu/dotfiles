#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)
ZIP_FILENAME="DiscreteScroll.zip"
APP_FILENAME="DiscreteScroll.app"
VERSION="v0.1.1"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    
    if [ ! -d "/Applications/DiscreteScroll.app" ]; then
        wget "https://github.com/emreyolcu/discrete-scroll/releases/download/$VERSION/$ZIP_FILENAME" -O "/tmp/$ZIP_FILENAME"
        unzip -o "/tmp/$ZIP_FILENAME"
        mv "$APP_FILENAME" /Applications/

        osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/DiscreteScroll.app", hidden:true}'
    fi

    echo "Discrete Scroll ✅"
fi
