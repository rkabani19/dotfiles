syntax on

set cursorline
set expandtab
set hidden
set ignorecase
set incsearch
set lazyredraw
set nobackup
set noerrorbells
set noswapfile
set nowrap
set nu
set smartcase
set smartindent
set splitbelow
set splitright
set termguicolors
set undofile

set shiftwidth=2
set tabstop=2 softtabstop=2
set undodir=~/.config/nvim/undodir

let mapleader=" "

" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <leader>r :Rg<CR>

" go
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"

" remove white spaces
autocmd BufWritePre * :%s/\s\+$//e

" vim mappings
imap jj <Esc>

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
noremap <leader>y "*y
noremap <leader>p "*p

" undotree
nnoremap <leader>u :UndotreeShow<CR>

" git (fugitve) stuff
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

" telescope
lua require("telescope_custom")
nnoremap <leader>f :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tgb :lua require('telescope_custom').git_branches()<CR>
nnoremap <leader>ts :lua require('telescope.builtin').live_grep()<Cr>
nnoremap <leader>tw :lua require('telescope.builtin').grep_string()<Cr>
nnoremap <leader>vrc :lua require('telescope_custom').search_dotfiles()<CR>
