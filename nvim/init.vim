call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'uiiaoo/java-syntax.vim'
call plug#end()

set number
set tabstop=4
set shiftwidth=4
set listchars=tab:»\ ,trail:·
set list

autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4 wrapmargin=0
nnoremap <F5> :w<CR>:split term://javac %:p && java %:t:r<CR>
nnoremap <F6> :!del %:t:r.class<CR>

syntax enable
filetype plugin indent on
colorscheme dracula
