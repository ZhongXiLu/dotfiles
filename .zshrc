

SYSTEM_TYPE=$(uname -s)
[[ "$SYSTEM_TYPE" = "Darwin" ]] && LOCAL_DIR="/usr/local"
[[ "$SYSTEM_TYPE" = "Linux" ]] && LOCAL_DIR="/home/linuxbrew/.linuxbrew"

#=====
# ZSH
#=====

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="zhong"
export UPDATE_ZSH_DAYS=14
DISABLE_MAGIC_FUNCTIONS="true"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

plugins=(
    git
)

[[ -e $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
[[ -e "$LOCAL_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$LOCAL_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -e "$LOCAL_DIR/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$LOCAL_DIR/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

autoload -Uz compinit
compinit

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
[[ -e $HOME/.config/aliases/.bosa_aliases ]] && source $HOME/.config/aliases/.bosa_aliases

#=======
# Other
#=======
export EDITOR='nano'
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix go)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GPG_TTY=$(tty)

#=========
# SDKMAN!
#=========
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
