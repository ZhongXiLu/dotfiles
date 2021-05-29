#!/bin/bash

set -eu

SYSTEM_TYPE=$(uname -s)

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
    
    if [ ! command -v brew >/dev/null 2>&1 ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew ✅"
    fi

    if ! brew list yadm >/dev/null; then
        brew install yadm
        echo "yadm ✅"
    fi

    if [ ! -f "$HOME/.config/yadm/bootstrap" ]; then
        yadm clone https://github.com/ZhongXiLu/dotfiles.git --no-bootstrap
    fi

    yadm bootstrap
    yadm decrypt

    if git config remote.faraway.url > /dev/null; then
        yadm remote add origin git@github.com:ZhongXiLu/dotfiles.git
    fi

fi
