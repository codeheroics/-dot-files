export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

setopt interactivecomments

export NVM_DIR="/home/ffenril/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

alias s='git status'
alias d='git diff'
alias ds='git diff --staged'
alias gg='git grep'
alias ggi='git grep -i'
alias gclean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

function emulator { ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@"; ) }

fortune

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
