DOTFILES=~/dotfiles/zsh

#export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/rkabani/.oh-my-zsh"

# theme
ZSH_THEME=""
export TERM="xterm-256color"

# go
export GOPATH=$HOME/golib

# plugins
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  git
  z
)

# oh my zsh
source $ZSH/oh-my-zsh.sh

# aliases
source $DOTFILES/aliases.zsh

# more theme stuff
autoload -U promptinit; promptinit 
prompt pure
