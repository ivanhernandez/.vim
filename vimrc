filetype plugin indent on
set backspace=indent,eol,start
set hidden confirm 
set incsearch hlsearch
set ignorecase smartcase
set number relativenumber
set scrolloff=5
set signcolumn=yes
set noerrorbells
" setlocal colorcolumn=80

set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab autoindent smartindent

set noswapfile nobackup undofile

source ~/.vim/plugins.vim
source ~/.vim/completions.vim
source ~/.vim/keybindings.vim

let NERDTreeQuitOnOpen=1
let g:BASH_Ctrl_j = 'off'

set termguicolors guifont=Victor\ Mono:h18

let g:curswtheme = "default"
function SwitchDarkLightThemes()
if g:curswtheme == "dark"
    let g:curswtheme="light"
    set background=light
    colorscheme duochrome
    redraw
elseif g:curswtheme == "light"
    let g:curswtheme="bruin"
    set background=light
    source ~/.vim/colors/bruin.vim
    redraw
else
    let g:curswtheme="dark"
    set background=dark
    colorscheme bogster
    hi Comment gui=italic guifg=#627d9d     
    hi Boolean gui=italic guifg=#59dcb7
    hi Keyword gui=italic guifg=#dcb659
    hi Search guibg=#9ea4c2
    hi link csComment Comment
    hi link csXmlTag Comment
    redraw
endif
endfunction

call SwitchDarkLightThemes()
syntax on

if has("nvim")
    lua require('gitsigns').setup()
endif



