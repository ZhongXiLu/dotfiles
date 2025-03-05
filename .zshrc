

ARCHITECTURE=$(uname -m)
[[ "$ARCHITECTURE" = "x86_64" ]] && LOCAL_DIR="/usr/local"
[[ "$ARCHITECTURE" = "arm64" ]] && LOCAL_DIR="/opt/homebrew"

#=====
# ZSH
#=====

autoload -U colors && colors
autoload -Uz compinit
compinit

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="zhong"
zstyle ':omz:update' mode reminder
export UPDATE_ZSH_DAYS=30
DISABLE_MAGIC_FUNCTIONS="true"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

plugins=(
    git
)

[[ -e $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
[[ -e "$LOCAL_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$LOCAL_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -e "$LOCAL_DIR/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$LOCAL_DIR/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

#========
# iTerm2
#========
[[ -e "$HOME/.config/iterm2/.iterm2_shell_integration.zsh" ]] && source "$HOME/.config/iterm2/.iterm2_shell_integration.zsh"

#==================
# Homebrew (Linux)
#==================
[[ -d "/home/linuxbrew" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#====
# Z
#====
[[ -e "$LOCAL_DIR/etc/profile.d/z.sh" ]] && . "$LOCAL_DIR/etc/profile.d/z.sh"

#=========
# Aliases
#=========
[[ -e $HOME/.config/aliases/.aliases ]] && source $HOME/.config/aliases/.aliases
[[ -e $HOME/.config/aliases/.dpg_aliases ]] && source $HOME/.config/aliases/.dpg_aliases
# [[ -e $HOME/.config/aliases/.bosa_aliases ]] && source $HOME/.config/aliases/.bosa_aliases

#=======
# Other
#=======
export EDITOR='vim'
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export LDFLAGS="-L/usr/local/opt/ncurses/lib -L/usr/local/opt/node@14/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include -I/usr/local/opt/node@14/include"
export GOPATH=$HOME/go
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GOROOT="$(brew --prefix go)/libexec"
export GPG_TTY=$(tty)

#===================
# Bonsai on startup
#===================
if [[ $__CFBundleIdentifier != "com.jetbrains.intellij" ]]; then
    cbonsai -p -L 42
fi
