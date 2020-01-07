" automatic installation of vim-plug, if it's not available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')
Plug 'haishanh/night-owl.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

Plug 'jparise/vim-graphql'

Plug 'w0rp/ale'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

set laststatus=2
