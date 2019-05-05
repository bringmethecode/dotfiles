### oh-my-zsh
	export ZSH="/home/ansky/.oh-my-zsh"
	ZSH_THEME="terminalpartied"
	plugins=(git)
	source $ZSH/oh-my-zsh.sh


### session init
	export EDITOR=nvim
	eval $(thefuck --alias --enable-experimental-instant-mode)
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
	ufetch

### function utils
	# find
	function f() { find . -iname "*$1*" ${@:2} }

    # search in files
	function r() { grep -Rnwi "$1" ${@:2} . }

	# find and move to directory
	fd() {
		local dir
		dir=$(find ${1:-.} -path '*/\.*' -prune \
			-o -type d -print 2> /dev/null | fzf +m) &&
		cd "$dir"
	}

	# search in command history and execute command
	fh() {
		eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
	}

	# Create folder and move to it
	function mkcd() { mkdir -p "$@" && cd "$_"; }

### aliases
	alias s="sudo"
	alias pki="s pacman -S"
	alias ws="cd ~/Workspace/"
	alias bt="bluetoothctl"
	alias nv="nvim"
	alias snv="s nv"
	alias ut="tar zxfv"
	alias gpg='git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d'

	# todolist
	alias tl='todolist'
	alias tll='todolist l by p'
	alias tla='todolist a'
	alias tlc='todolist c'
	alias tlgc='todolist gc'
	alias tlar='todolist ar'

### path
	export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
