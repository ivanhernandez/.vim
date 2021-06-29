set noerrorbells
set incsearch hlsearch
" set ignorecase smartcase
set number relativenumber
set termguicolors guifont=Victor\ Mono:h18
colorscheme bogster

autocmd InsertEnter * set nohlsearch
autocmd InsertLeave * set hlsearch

filetype plugin indent on
set hidden confirm 
set backspace=indent,eol,start
syntax on

hi Comment gui=italic guifg=#627d9d     
hi Boolean gui=italic guifg=#59dcb7
hi Keyword gui=italic guifg=#dcb659
hi Search guibg=#9ea4c2
hi link csComment Comment
hi link csXmlTag Comment

set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab autoindent smartindent
set scrolloff=5
set signcolumn=yes
" setlocal colorcolumn=80

set noswapfile nobackup undofile

let NERDTreeQuitOnOpen=1
let g:BASH_Ctrl_j = 'off'

