export ZSH="/Users/andre/.oh-my-zsh"
ZSH_THEME="common"
plugins=(
  git
  git-flow
  npm
  node
)

source $ZSH/oh-my-zsh.sh
source ~/env.sh

eval $(thefuck --alias)

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
