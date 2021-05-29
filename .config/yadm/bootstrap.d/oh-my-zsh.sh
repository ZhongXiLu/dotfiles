#!/bin/bash

set -eu

DOTS_THEME_FILE="$HOME/.config/oh-my-zsh/zhong.zsh-theme"
OHMYZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/themes/zhong.zsh-theme"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    [[ -f ".zshrc.pre-oh-my-zsh" ]] && mv ".zshrc.pre-oh-my-zsh" ".zshrc"
fi

[ -L "$OHMYZSH_THEME_FILE" ] && rm "$OHMYZSH_THEME_FILE"
ln -s "$DOTS_THEME_FILE" "$OHMYZSH_THEME_FILE"

echo "Oh My Zsh ✅"
