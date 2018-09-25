set termguicolors
set number
set relativenumber
colo desert

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db,*.o,*.a

" histroy/undo
set history=1000            " store a ton of history (default is 20)
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone

" Basic settings
set tabstop=4
set shiftwidth=4
set autoread                " automatically read changed files

" search
set smartcase               " search casesensitive if pattern contains uppercase chars
set ignorecase              " overwritten by smartcase if it contains uppercase chars
