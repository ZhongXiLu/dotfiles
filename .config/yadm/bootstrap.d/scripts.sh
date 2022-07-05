#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)

if [[ "$SYSTEM_TYPE" = "Darwin" || "$SYSTEM_TYPE" = "Linux" ]]; then
    sudo cp ~/.config/scripts/* /usr/local/bin/ 
    echo "User Scripts ✅"
fi
