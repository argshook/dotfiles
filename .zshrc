PATH=$(getconf PATH)
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/go/bin:$HOME/.argsdotfiles/bin:$HOME/.local/bin:$HOME/.rvm/bin:$HOME/.cargo/bin:$HOME/.yarn/bin
export PHANTOMJS_BIN=/usr/local/bin/phantomjs
export VISUAL="nvim"
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_ALT_C_COMMAND='rg'
export FZF_CTRL_T_COMMAND='rg --files --hidden --no-ignore --iglob !node_modules'
export FZF_TMUX=1
export MANPAGER="nvim +Man!"
export DOTREMINDERS="~/zettel/reminders"
export PASSWORD_STORE_DIR="$HOME/zettel/pass"
export JAVA_HOME=`which java`
export BROWSER=`which qutebrowser`

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

# ruby
source_if_exists $HOME/.rvm/scripts/rvm

# fasd
eval "$(fasd --init auto)"

# vi keys bindings
bindkey -v
bindkey '^ ' autosuggest-accept

# fzf
source_if_exists ~/.argsdotfiles/zsh/fzf

# history
setopt INC_APPEND_HISTORY # add commands immediatelly, not only after leaving shell
setopt EXTENDED_HISTORY # add timestamps to history file entries
setopt HIST_IGNORE_ALL_DUPS # do not write duplicates to history
setopt HIST_IGNORE_SPACE
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILE=~/.zhistory
export HISTTIMEFORMAT="[%F %T] "
export HISTIGNORE="in:zet:t:pass"
export GH_PAGER=cat

alias kurwa="killall -9"
_npmnx () {
  find . \( -name node_modules -o -name yarn.lock \) -exec echo "Removing {}" \; -exec rm -rf {} \; 2>/dev/null
}

alias npmnx="_npmnx"
alias q="exit"
alias r="ranger"
alias rn="ranger node_modules"
alias n="nvim"
alias nu="nvim -u NONE"
alias b="buku -S"
alias gn="BROWSER=w3m googler --first nethack "

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
alias tmuxa="tmux attach-session -t" # attach to session
alias tmuxn="tmux new-session -s" # create new session
alias tmuxk="tmux kill-session -t" # kill session
alias tmuxl="tmux ls" # list all sessions

# tmuxinator
alias mux="tmuxinator"

# task
alias in="task add +in"
alias out="_taskwarrior_out"
alias tin="task in"
alias ta="task active"
alias thidden="task list +hide"
alias treview="task add +review"
alias tfix="task add +fix"
alias tmerge="task add +merge"
alias trecent="task limit:20 \( status:completed or status:deleted \) rc.report.all.sort:end- all"
alias tnext="task add +next"
alias tyesterday="task end.after:today-1d completed -in"

_taskwarrior_browse () {
  local id=$1
  if [ "$#" -eq 1 ]; then
    task $id | get-url | xargs qutebrowser
  fi
}
alias tbrowse="_taskwarrior_browse"

_taskwarrior_out () {
  local id=$1
  if [ "$#" -ge 1 ]; then
    shift
    task $id mod -in $@
  fi
}

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

  if [ "$#" -ge 2 ]; then
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

_npm_clone () {
  # depends on ~/.argsdotfiles/bin/clone
  clone `npm view $1 repository.url`
}
alias clone-npm="_npm_clone"

_kill_port () {
  kill -9 $(lsof -ti :$1)
}
alias killport="_kill_port"

# misc
alias grep="grep --color=auto"
alias cl="clear"
alias browse="xargs qutebrowser" # usage: echo google.com | browse

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

source_if_exists ~/.private.zshrc

eval "$(fnm env)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

