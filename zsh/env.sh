export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/andre/Documents/workspace/flutter/bin"

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=nvim

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Example aliases
alias ws='cd ~/Documents/workspace/'
alias vpnstart='sudo ~/./ciscoconnect start'
alias vpnstop='sudo ~/./ciscoconnect stop'
alias g='git'
eval $(thefuck --alias)

# todolist
alias tl='todolist'
alias tll='todolist l by p'
alias tla='todolist a'
alias tlc='todolist c'
alias tlgc='todolist gc'
alias tlar='todolist ar'

# utils
alias gpg='git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
