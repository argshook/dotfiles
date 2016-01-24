# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# lock screen after 3 minutes of inactivity

# disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# disable colors in ls
# DISABLE_LS_COLORS="true"

# disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:./node_modules/.bin
export ZSH=$HOME/.oh-my-zsh
export PHANTOMJS_BIN=/usr/local/bin/phantomjs

source $ZSH/oh-my-zsh.sh

# workhorse specific
if [ $HOST = "workhorse" ]; then
  source ~/.oh-my-zsh/workhorse
  source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  plugins=(git brew git-flow github npm osx sublime autojump)

  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  . `brew --prefix`/etc/profile.d/z.sh

  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# slipper specific
if [ $HOST = "slipper" ]; then
 plugins=(git git-flow github npm autojump)

 source /usr/share/nvm/nvm.sh
 source /usr/share/nvm/bash_completion
fi

# theme
source ~/.argsdotfiles/zsh/theme.zsh-theme

# vi keys bindings
bindkey -v

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# git
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gpl="git pl"
alias gra="git rm $(git ls-files --deleted)"
alias gs="git status"
alias gss="gs -sb"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git lg"
alias glweek="git shortlog -s --since="last week""
alias gp="git push"
alias gm="git merge"
alias gpo="git push origin"
alias gsh="git stash"
alias gshl="git stash list"
alias gshc="git stash clear"
alias gsha="git stash apply"
alias gisnew="git remote update && gs"

# tmux
alias tmuxa="tmux -2 a -t" # attach to session
alias tmuxn="tmux -2 new -s" # create new session
alias tmuxk="tmux kill-session -t" # kill session
alias tmuxl="tmux ls" # list all sessions

# misc
alias servedir="python -m SimpleHTTPServer 4523 && chrome localhost:4523"
alias filesize=__fileSize
alias grep="grep --color=auto"
alias cl="clear"

function __bowerGetMain {
  if [ "$1x" != 'x' ]; then
    bower info $1 | grep main
  fi
}

function __fileSize {
  if [ "$1x" != 'x' ]; then
    ls -lah $1 | awk '{ print $5 }'
  fi
}

# fix for git log not displaying special characters correctly
export LC_ALL=en_US.UTF-8

# do not share command history between terminal instances
unsetopt SHARE_HISTORY

# 10ms for key sequences
KEYTIMEOUT=1

