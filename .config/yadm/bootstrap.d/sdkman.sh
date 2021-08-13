#!/bin/bash

set -e

DOTS_CONFIG_FILE="$HOME/.config/sdkman/config"
SDKMAN_CONFIG_FILE="$HOME/.sdkman/etc/config"

declare -a JAVA_VERSIONS=("8" "11" "16")

if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io?rcupdate=false" | bash
fi

[[ -L "$SDKMAN_CONFIG_FILE" || -f "$SDKMAN_CONFIG_FILE" ]] && rm "$SDKMAN_CONFIG_FILE"
ln -s "$DOTS_CONFIG_FILE" "$SDKMAN_CONFIG_FILE"
source "$HOME/.sdkman/bin/sdkman-init.sh"

for JAVA_VERSION in "${JAVA_VERSIONS[@]}"; do

    # Check if java version is already installed, if not, install it
    # Does NOT have to be latest version
    if [[ ! $(sdk list java | grep -E "((local only)|(installed)).*$JAVA_VERSION[^|]*.hs-adpt") ]]; then
        JAVA_VERSION_IDENTIFIER=$(sdk list java | grep -E "adpt.*$JAVA_VERSION[^|]*.hs-adpt" | tr -s ' ' | rev | cut -d ' ' -f 2 | rev)
        sdk install java $JAVA_VERSION_IDENTIFIER
    fi

done


echo "SDKMAN! ✅"
