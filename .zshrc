
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

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -Uz compinit
compinit

#========
# iTerm2
#========
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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
export GPG_TTY=$(tty)

#=========
# SDKMAN!
#=========
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
