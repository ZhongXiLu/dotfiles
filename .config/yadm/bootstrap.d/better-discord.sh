#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)
BD_ZIP_FILENAME="BetterDiscord-Mac.zip"
BD_APP_FILENAME="BetterDiscord.app"
BD_THEME_FILENAME="$HOME/.config/betterdiscord/nocturnal.theme.css"
BD_THEME_FILENAME_LOCATION="$HOME/Library/Application Support/BetterDiscord/themes/nocturnal.theme.css"
DOTS_STABLE_LOCATION="$HOME/.config/betterdiscord/stable"
BD_STABLE_LOCATION="$HOME/Library/Application Support/BetterDiscord/data/stable"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then

    if [[ -d "/Applications/Discord.app" && ! -d "/Applications/$BD_APP_FILENAME" ]]; then
        wget -q "https://github.com/BetterDiscord/Installer/releases/latest/download/$BD_ZIP_FILENAME" -O "/tmp/$BD_ZIP_FILENAME"
        unzip -oq "/tmp/$BD_ZIP_FILENAME"
        mv "$BD_APP_FILENAME" /Applications/
        open -g -W "/Applications/$BD_APP_FILENAME"
    fi

    if [[ -d "/Applications/$BD_APP_FILENAME" ]]; then
        [ -L "$BD_THEME_FILENAME_LOCATION" ] && rm "$BD_THEME_FILENAME_LOCATION"
        ln -s "$BD_THEME_FILENAME" "$BD_THEME_FILENAME_LOCATION"

        [[ -d "$BD_STABLE_LOCATION" ]] && rm -rf "$BD_STABLE_LOCATION"
        [ -L "$BD_STABLE_LOCATION" ] && rm "$BD_STABLE_LOCATION"
        ln -s "$DOTS_STABLE_LOCATION" "$BD_STABLE_LOCATION"
    fi

    echo "BetterDiscord ✅"
fi
# TODO: linux and windows
