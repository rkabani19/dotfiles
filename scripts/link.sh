#!/bin/bash

# nvim
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/nvim/coc/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/dotfiles/nvim/coc/package.json ~/.config/coc/extensions/package.json

# zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# tmux
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# git
ln -sf ~/dotfiles/git/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig

