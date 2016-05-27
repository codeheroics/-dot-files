export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="random"

plugins=(git node npm bower z emotty battery)

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export MANPATH="/usr/local/man:$MANPATH"
export ANDROID_HOME=/opt/android-sdk-linux
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

source $ZSH/oh-my-zsh.sh

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

source ~/.nvm/nvm.sh
fortune
cd dev
