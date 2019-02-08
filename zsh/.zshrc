DOTFILES=~/dotfiles/zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/rohailkabani/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel9k/powerlevel9k"

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
