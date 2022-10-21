_taskwarrior_browse () {
  local id=$1
  if [ "$#" -eq 1 ]; then
    task $id | get-url | xargs qutebrowser
  fi
}

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

_taskwarrior_next () {
  local id=$1

  if [[ -n $id ]]; then
    shift
    task $id modify -in wait: $@
  fi
}

_taskwarrior_now () {
  local id=$1

  if [[ -n $id ]]; then
    shift
    task $id modify -in wait: $@
    task $id start
  fi
}

alias tbrowse="_taskwarrior_browse"
alias tfind="_taskwarrior_find"
alias later=_taskwarrior_later
alias next=_taskwarrior_next
alias tnow=_taskwarrior_now
alias tin="task add +in"
alias tinlist="task in"
alias tout="_taskwarrior_out"
alias ta="task active"
alias thidden="task list +hide"
alias treview="task add +review"
alias tfix="task add +fix"
alias tmerge="task add +merge"
alias trecent="task limit:20 \( status:completed or status:deleted \) rc.report.all.sort:end- all"
alias tnext="task add +next"
alias tyesterday="task end.after:today-1d completed -in"
