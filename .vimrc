set termguicolors
set number
set relativenumber
colo desert

" Basic settings
set tabstop=4
set shiftwidth=4
set autoread                " automatically read changed files
set smarttab
syntax enable
filetype indent on

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db,*.o,*.a

" histroy/undo
set history=1000            " store a ton of history (default is 20)
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone

" search
set smartcase               " search casesensitive if pattern contains uppercase chars
set ignorecase              " overwritten by smartcase if it contains uppercase chars


":W - mkdir -p for unexistent directories
function WriteCreatingDirs()
	execute ':silent !mkdir -p %:h'
	write
endfunction
command W call WriteCreatingDirs()

" void-packages template file
autocmd BufNewFile,BufRead template set ft=sh sts=0 sw=0 noet
