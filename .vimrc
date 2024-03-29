set termguicolors
set number
set relativenumber
" colo desert
colo evening

" Basic settings
set mouse=
set tabstop=4
set shiftwidth=4
set autoread
set smarttab
set cursorline
set colorcolumn=80
set scrolloff=5
syntax enable
filetype plugin indent on

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db,*.o,*.a

" histroy/undo
set history=1000            " store a ton of history (default is 20)
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone

" search
set incsearch
set hlsearch
set smartcase               " search casesensitive if pattern contains uppercase chars
set ignorecase              " overwritten by smartcase if it contains uppercase chars

" splits
set splitbelow
set splitright


":W - mkdir -p for unexistent directories
function WriteCreatingDirs()
	execute ':silent !mkdir -p %:h'
	write
endfunction
command W call WriteCreatingDirs()

command Cppcheck execute ':silent ! cppcheck --enable=all %'
command Shellcheck execute ':! shellcheck -x %'
command Shfmt execute ':silent ! shfmt -w -ci %'

" void-packages template file
autocmd BufNewFile,BufRead template set ft=sh sts=0 sw=0 noet
" bats is bash, mostly
autocmd BufNewFile,BufRead *.bats set filetype=bash


" https://github.com/vim-autoformat/vim-autoformat
let g:formatdef_overwrite_shfmt = '"shfmt -ci -i ".(&expandtab ? shiftwidth() : "0")'
let g:formatters_sh = ['overwrite_shfmt']
let g:formatters_python = ['black', 'autopep8']
let g:formatters_javascript = ['eslint_local', 'prettier']
" let g:autoformat_verbosemode=1


lua << EOF
-- Setup language servers
local lspconfig = require("lspconfig")

-- lspconfig.bashls.setup {
--   filetypes = { "sh", "bash", "zsh" },
--   settings = {
--     bashIde = {
--       globPattern = "*@(.sh|.inc|.bash|.command|.bats)"
--     }
--   }
-- }

lspconfig.clangd.setup {}

lspconfig.gopls.setup {}

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
		black = {
			enabled = true
		},
		flake8 = {
			enabled = true
		},
		pylint = {
			enabled = true
		},
		isort = {
			enabled = true
		},
		rope = {
			enabled = true
		},
      }
    }
  }
}

lspconfig.tsserver.setup {}


-- global mappings
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Buffer local mapping
	-- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true, buffer=ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)

    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', '<space>df', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
  end
})
EOF
