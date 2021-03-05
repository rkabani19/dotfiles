call plug#begin('~/.config/nvim/plugged')
  " theme
  Plug 'arcticicestudio/nord-vim'

  " autcomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " show history
  Plug 'mbbill/undotree'

  " language pack
  Plug 'sheerun/vim-polyglot'

  " search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " go
  Plug 'fatih/vim-go'

  " status & tabline
  Plug 'vim-airline/vim-airline'

  " auto close brackets
  Plug 'jiangmiao/auto-pairs'

  " auto comment
  Plug 'tpope/vim-commentary'

  " telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()
