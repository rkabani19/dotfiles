" ui stuff
set number
set updatetime=100

" git gutter colors
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" tabs and spaces configuration
set expandtab
filetype plugin indent on
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" remove white spaces
autocmd BufWritePre * :%s/\s\+$//e

" better search
set hlsearch

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>g :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" fuzzy search
nnoremap <silent> <Leader>p :FZF<CR>
let g:fzf_layout = { 'down': '~15%' }

" commenting
noremap \\ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

" preferences
inoremap jj <Esc>
