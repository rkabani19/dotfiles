call plug#begin('~/.config/nvim/plugged')
  " theme
  Plug 'arcticicestudio/nord-vim'

  " autcomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " git wrapper
  Plug 'tpope/vim-fugitive'

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
call plug#end()
