syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set cursorline

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#4C566A

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_liststyle=3
let g:netrw_browse_split = 2
let g:netrw_banner = 0

" remove white spaces
autocmd BufWritePre * :%s/\s\+$//e

imap jj <Esc>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>b :Lex<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>r :Rg<CR>

" git stuff
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :G<CR>

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
