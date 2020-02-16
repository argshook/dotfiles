export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/go/bin:./node_modules/.bin:$HOME/.argsdotfiles/bin:$HOME/.local/bin:$HOME/.rvm/bin
export PHANTOMJS_BIN=/usr/local/bin/phantomjs
export VISUAL="nvim"
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export PAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

source ~/.argsdotmodules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle djui/alias-tips
antigen bundle taskwarrior
antigen bundle tmuxinator

antigen apply

# press V in normal mode to edit command in nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

IS_SSH_AGENT_RUNNING=`ps ax|grep -c "[s]sh-agent"`
if (( $IS_SSH_AGENT_RUNNING  == 0 )) then
  touch ~/.ssh-env
  ssh-agent | head -2 > ~/.ssh-env
  source ~/.ssh-env
  ssh-add
else
  source ~/.ssh-env
fi

# utility function to avoid errors
source_if_exists () {
  if [[ -f $1 ]]; then
    source $1
  fi
}

# theme
source_if_exists ~/.argsdotfiles/zsh/theme.zsh-theme

# fzf
source_if_exists /usr/share/fzf/key-bindings.zsh

# ruby
source_if_exists $HOME/.rvm/scripts/rvm

# fasd
eval "$(fasd --init auto)"

# vi keys bindings
bindkey -v
bindkey '^ ' autosuggest-accept

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-pattern-search-backward
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

alias kurwa="killall -9"
alias npmnx="rm -rf node_modules package-lock.json"
alias q="exit"
alias r="ranger"
alias rn="ranger node_modules"
alias n="nvim"
alias b="buku -S"

# git
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gpl="git pull --rebase"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"

alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gl5="gl -5"
alias glweek="git shortlog -s --since="last week""
alias gp="git push"
alias gpo="git push origin"

alias gisnew="git remote update && gs"
alias gitlarge='~/.argsdotfiles/zsh/git-largest-files.py'

# tmux
alias tmuxa="tmux -2 a -t" # attach to session
alias tmuxn="tmux -2 new -s" # create new session
alias tmuxk="tmux kill-session -t" # kill session
alias tmuxl="tmux ls" # list all sessions

# tmuxinator
alias mux="tmuxinator"

# task
alias in="task add +in"
alias tin="task in"
alias ta="task active"
alias treview="task add +review"
alias tfix="task add +fix"
alias tmerge="task add +merge"
alias trecent="task limit:20 \( status:completed or status:deleted \) rc.report.all.sort:end- all"
alias tnext="task add +next"
alias thome="task context home && task ls"
alias tall="task context none && task ls"

_taskwarrior_browse () {
  local id=$1
  if [ "$#" -eq 1 ]; then
    task $id | get-url | xargs chromium
  fi
}
alias tbrowse="_taskwarrior_browse"

_taskwarrior_find () {
  local query=$1
  if [ "$#" -eq 1 ]; then
    task /$query/ all -COMPLETED -DELETED
  fi
}
alias tfind="_taskwarrior_find"

_taskwarrior_later () {
  local id=$1
  local wait=${2:-"tomorrow"}

  if [ "$#" -eq 1 ]; then
    shift
  fi

  if [ "$#" -eq 2 ]; then
    shift
    shift
  fi

  task $id modify -in wait:$wait $@
}
alias later=_taskwarrior_later

_taskwarrior_next () {
  local id=$1

  if [[ -n $id ]]; then
    shift
    task $id modify -in wait: $@
  fi
}
alias next=_taskwarrior_next

_taskwarrior_now () {
  local id=$1

  if [[ -n $id ]]; then
    shift
    task $id modify -in wait: $@
    task $id start
  fi
}
alias tnow=_taskwarrior_now

# misc
alias grep="grep --color=auto"
alias cl="clear"

# fix for git log not displaying special characters correctly
export LC_ALL=en_US.UTF-8

# do not share command history between terminal instances
unsetopt SHARE_HISTORY

# 10ms for key sequences
KEYTIMEOUT=1

# required by gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
unset zle_bracketed_paste

unsetopt BEEP

# fnm
export PATH=$HOME/.fnm:$PATH
eval `fnm env`

source_if_exists ~/.private.zshrc
