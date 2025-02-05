" Enable line numbers
set number

" Enable syntax highlighting
syntax enable
filetype plugin indent on

" Set tabs to 4 spaces for Java code style
set tabstop=4
set shiftwidth=4
set expandtab

" Enable line wrapping for longer lines
set wrap

" Show matching parentheses/brackets
set showmatch

" Highlight search results as you type
set incsearch
set ignorecase

" Display line and column number in status line
set ruler

" Enable line break on insert
set linebreak

" Show extra whitespace characters
set list
set listchars=tab:»\ ,trail:·

" Filetype-specific settings for Java
autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType java setlocal softtabstop=4

" Auto indent code properly for Java
set smartindent
set cindent
set autoindent
set indentexpr=

" Enable automatic indentation with a 4-space tab stop
set smarttab
set shiftround

" Disable line wrapping in code comments (improves readability)
autocmd FileType java setlocal wrapmargin=0

" Save file with Ctrl + S
nnoremap <C-s> :w<CR>

" Run Java code with F5
nnoremap <F5> :w<CR>:split term://javac %:p && java %:t:r<CR>

" Close the current window with Ctrl + Q
nnoremap <C-q> :q<CR>

" Toggle between split windows with Ctrl + H/J/K/L
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
