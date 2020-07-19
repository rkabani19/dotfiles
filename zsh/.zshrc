DOTFILES=~/dotfiles/zsh

export ZSH="/Users/rkabani/.oh-my-zsh"

# theme
ZSH_THEME=""
export TERM="xterm-256color"

# plugins
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  git
  z
)

# go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# oh my zsh
source $ZSH/oh-my-zsh.sh

# aliases
source $DOTFILES/aliases.zsh

# more theme stuff
autoload -U promptinit; promptinit
prompt pure
