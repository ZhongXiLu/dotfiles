#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)

if [[ "$SYSTEM_TYPE" = "Darwin" || "$SYSTEM_TYPE" = "Linux" ]]; then
    mkdir -p $HOME/go/{bin,src,pkg}
    echo "Go ✅"
fi
