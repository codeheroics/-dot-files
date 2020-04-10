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

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

fortune

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
