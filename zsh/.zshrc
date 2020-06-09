DOTFILES=~/dotfiles/zsh

#export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/rohailkabani/.oh-my-zsh"

# theme
export TERM="xterm-256color"
ZSH_THEME="powerlevel9k/powerlevel9k"

# ruby
eval "$(rbenv init -)"

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

# powerlevel9k config
source $DOTFILES/powerlevel9k.zsh
