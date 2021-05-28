#!/bin/bash

set -e

DOTS_CONFIG_FILE="$HOME/.config/sdkman/config"
SDKMAN_CONFIG_FILE="$HOME/.sdkman/etc/config"

declare -a JAVA_CANDIDATES=(
    "8.0.282.j9-adpt"
    "11.0.10.j9-adpt"
    "16.0.1.j9-adpt"
)

if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io?rcupdate=false" | bash
fi

[[ -L "$SDKMAN_CONFIG_FILE" || -f "$SDKMAN_CONFIG_FILE" ]] && rm "$SDKMAN_CONFIG_FILE"
ln -s "$DOTS_CONFIG_FILE" "$SDKMAN_CONFIG_FILE"
source "$HOME/.sdkman/bin/sdkman-init.sh"

for java_candidate in "${JAVA_CANDIDATES[@]}"; do
    sdk install java "$java_candidate"
done


echo "SDKMAN! ✅"
