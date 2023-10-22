#!/bin/bash

set -eu

USER=$(id -un)

if [[ "$SYSTEM_TYPE" = "Darwin" ]] && [ ! xcode-select --print-path &>/dev/null ]; then
    xcode-select --install
    echo "Xcode cli tools ✅"
fi

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

if [ $USER == "zhongxilu" ]; then
    yadm decrypt --yadm-archive "$HOME/.config/yadm/archive"
fi

if git config remote.faraway.url > /dev/null; then
    yadm remote add origin git@github.com:ZhongXiLu/dotfiles.git
fi
