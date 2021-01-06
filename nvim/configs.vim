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

let mapleader=" "

let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"

let g:fzf_layout = { 'down': '~30%' }

" remove white spaces
autocmd BufWritePre * :%s/\s\+$//e

imap jj <Esc>

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>r :Rg<CR>
noremap <leader>y "*y
noremap <leader>p "*p

" git stuff
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :G<CR>

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" File tree (testing...)
nmap <leader>b :CocCommand explorer<CR>

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
