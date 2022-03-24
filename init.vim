" Theme
colorscheme nordic

syntax on
filetype plugin indent on

" Options
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
set shiftwidth=2
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.config/nvim/undodir
set undofile

" Remap leader
let mapleader=" "

" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <leader>r :Rg<CR>

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

tnoremap <Esc> <C-\><C-n>

" undotree
nnoremap <leader>u :UndotreeShow<CR>

" Gitsigns
lua << EOF
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>ghn', '<cmd>Gitsigns next_hunk<CR>')
    map('n', '<leader>ghp', '<cmd>Gitsigns prev_hunk<CR>')
    map('n', '<leader>ghr', '<cmd>Gitsigns reset_hunk<CR>')
    map('n', '<leader>ghl', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF

" lualine
lua << EOF
require('lualine').setup {
  options = { theme = "nord", icons_enabled = false, },
}
EOF
set laststatus=3

" Nvim Tree
lua << EOF
require'nvim-tree'.setup { }
EOF

" telescope
lua << EOF
  local actions = require('telescope.actions')
  require('telescope').setup {
      defaults = {
          file_sorter = require('telescope.sorters').get_fzy_sorter,
          prompt_prefix = ' > ',
          color_devicons = true,
          prompt_position = "top",
          sorting_strategy = "ascending",

          file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      }
  }
  require('telescope').load_extension('fzy_native')
EOF
nnoremap <leader>f :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tgb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>ts :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>vrc :lua require('telescope.builtin').find_files({ cwd="~/.config/nixpkgs/" })<CR>
" nnoremap <leader>tw :lua require('telescope.builtin').grep_string()<Cr>

" autopairs
lua << EOF
  local npairs = require('nvim-autopairs')
  npairs.setup({
      fast_wrap = {
        map = '<C-e>',
      },
  })
EOF

" lsp
lua << EOF
local lsp = require('lspconfig')

local custom_on_attach = function(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
  vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {buffer=0})

  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {buffer=0})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {buffer=0})

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.gopls.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    custom_on_attach(client, bufnr)
  end,
}
lsp.rnix.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    custom_on_attach(client, bufnr)
  end,
}

-- rust-tools (testing)
require('rust-tools').setup({
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = { use_telescope = true },
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    server = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          custom_on_attach(client, bufnr)
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
})
EOF

" cmp
lua << EOF
  local cmp = require'cmp'

  vim.opt.completeopt = {"menu", "menuone", "noselect"}

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
      { name = 'path' },
    })
  })
EOF

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true }
}
EOF
