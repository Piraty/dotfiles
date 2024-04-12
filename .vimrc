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
set scrolloff=8
syntax enable
filetype plugin indent on

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db,*.o,*.a

" history/undo/swap
set history=1000            " store a ton of history (default is 20)
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set updatetime=100          " When to write swapfile to disk

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
command Shfmt execute ':! shfmt -w -ci %'
command Xgensum execute ':silent ! xgensum -i %'

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
		autopep8 = {
			enabled = false
		},
		black = {
			enabled = true
		},
		flake8 = {
			enabled = false
		},
		isort = {
			enabled = true,
			profile = "black",
			atomic = true
		},
		mccabe = {
			enabled = true
		},
		pycodestyle = {
			enabled = false
		},
		pylint = {
			enabled = true,
			args = {
				-- mimic black
				"--max-line-length 88",
				-- pylint shall look into venv as well, duh
				"--init-hook='import pylint_venv;pylint_venv.inithook(force_venv_activation=True)'"
			}
		},
		rope = {
			enabled = true
		},
		pylsp_mypy = {
			enabled = true,
			dmypy = true,
		},
      }
    }
  }
}

lspconfig.tsserver.setup {}

--vim.lsp.set_log_level("debug")


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
    vim.keymap.set('n', '<space>f', function()
		vim.lsp.buf.format { async = true }
	end, opts)
  end
})


local dap= require("dap")
local dap_ui_widgets= require("dap.ui.widgets")

local dapui = require("dapui")
dapui.setup()

local dap_virtual_text = require("nvim-dap-virtual-text")
dap_virtual_text.setup()

local dap_go = require("dap-go")
dap_go.setup {}

vim.keymap.set('n', '<space>db', "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set('n', '<space>dc', "<cmd>DapContinue<CR>")
vim.keymap.set('n', '<space>ds', "<cmd>DapStepInto<CR>")
vim.keymap.set('n', '<space>dn', "<cmd>DapStepOver<CR>")
vim.keymap.set('n', '<space>do', "<cmd>DapStepOut<CR>")
vim.keymap.set('n', '<space>dr', "<cmd>DapToggleRepl<CR>")
vim.keymap.set('n', '<space>dT', "<cmd>DapTerminate<CR>")
vim.keymap.set('n', '<space>dR', function() dap.run_last() end)

vim.keymap.set('n', '<space>du', function() dapui.toggle({reset=true}) end)
vim.keymap.set({ 'n', 'v' }, '<space>de', function() dapui.eval() end)
vim.keymap.set('n', '<space>dv', function() dap_ui_widgets.hover() end)


---- keymaps

-- yank to clipboard
vim.keymap.set('n', "<space>y", "\"+y")
vim.keymap.set('n', "<space>yy", "\"+yy")
vim.keymap.set('v', "<space>y", "\"+y")
vim.keymap.set('n', "<space>Y", "\"+Y")

-- vimprovement: center after possibly large jumps
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "<C-d>", "<C-d>zz")

-- explore / netrw
vim.keymap.set('n', "<space>e", ":Hex<CR>")
vim.keymap.set('n', "<space>E", ":Vex!<CR>")

-- split movement
vim.keymap.set('n', "<space>w", "<C-w>")

-- arglist
vim.keymap.set('n', "<space>n", ":next<CR>")
vim.keymap.set('n', "<space>p", ":previous<CR>")

EOF
