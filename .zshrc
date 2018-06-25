export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:./node_modules/.bin:$HOME/.rvm/bin:$HOME/.argsdotfiles/bin:$HOME/.local/bin
export PHANTOMJS_BIN=/usr/local/bin/phantomjs
export VISUAL="nvim"
export EDITOR="nvim"

source ~/.argsdotmodules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle djui/alias-tips

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

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# theme
source ~/.argsdotfiles/zsh/theme.zsh-theme

# fzf
source /usr/share/fzf/key-bindings.zsh

# vi keys bindings
bindkey -v
bindkey '^ ' autosuggest-accept

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-pattern-search-backward
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

alias kurwa="killall -9"
alias npmnx="rm -rf node_modules package-lock.json"
alias q="exit"
alias dl="curl -O"
alias r="ranger"

# git stagings
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gpl="git pull --rebase"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"

# git logging
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gl5="gl -5"
alias glweek="git shortlog -s --since="last week""

alias gp="git push"
alias gpo="git push origin"

# git stashing
alias gsh="git stash"
alias gshl="git stash list"
alias gshc="git stash clear"
alias gsha="git stash apply"

# git misc
alias gisnew="git remote update && gs"
alias gitlarge='~/.argsdotfiles/zsh/git-largest-files.py'

# tmux
alias tmuxa="tmux -2 a -t" # attach to session
alias tmuxn="tmux -2 new -s" # create new session
alias tmuxk="tmux kill-session -t" # kill session
alias tmuxl="tmux ls" # list all sessions

# misc
alias servedir="python -m SimpleHTTPServer 4523 && chrome localhost:4523"
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
