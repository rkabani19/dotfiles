.PHONY: all

all: brew link nvim terminal settings

brew:
	@echo "Install homebrew packages and apps"
	sh ~/dotfiles/scripts/brew.sh

link:
	@echo "Creating symlinks"
	sh ~/dotfiles/scripts/link.sh

nvim:
	@echo "Install nvim"
	sh ~/dotfiles/scripts/nvim.sh

terminal:
	@echo "Setting up iterm and zsh"
	sh ~/dotfiles/scripts/terminal.sh

settings:
	@echo "Configuring macOS settigns"
	sh ~/dotfiles/scripts/settings.sh
