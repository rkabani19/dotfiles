DOTFILES=~/dotfiles/zsh

#export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/rohailkabani/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# ruby
eval "$(rbenv init -)"

# go
export GOBIN=/usr/local/go/bin
export PATH=$PATH:$GOBIN

export GOPATH=/Users/rohailkabani/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=/Users/rohailkabani/desktop/playground/go/learn-go # example of workspace GOPATH

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
