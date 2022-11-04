filetype plugin indent on

set nocompatible

set backspace=indent,eol,start
set hidden confirm
set incsearch hlsearch
autocmd InsertEnter * set nohlsearch
autocmd InsertLeave * set hlsearch
set ignorecase smartcase
set number relativenumber
set scrolloff=5
set signcolumn=yes
set noerrorbells
" setlocal colorcolumn=80

set shiftwidth=4 tabstop=4 softtabstop=4
set listchars=tab:»\ ,trail:~
set list 
set expandtab autoindent smartindent

set noswapfile nobackup undofile

let g:BASH_Ctrl_j = 'off'

set termguicolors
"set guifont=BlexMono\ NF:h14
set guifont=GoMono\ NF:h14
set cursorline
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

command ChangeToCurrentBufferDirectory cd %:p:h
cabbrev cdc ChangeToCurrentBufferDirectory

source  ~/.vim/plugins.vim
source  ~/.vim/lsp-cmp.vim
luafile ~/.vim/lsp-cmp.lua
luafile ~/.vim/lsp-signature.lua
source  ~/.vim/keybindings.vim
luafile ~/.vim/gitsigns.lua
luafile ~/.vim/which-key.lua
source  ~/.vim/nvim-tree.vim
luafile ~/.vim/nvim-tree.lua


let g:curswtheme = "default"
function SwitchDarkLightThemes()
if g:curswtheme == "default"
    let g:curswtheme="light"
    set background=light
    colorscheme pompeii
    redraw
elseif g:curswtheme == "light"
    let g:curswtheme="dark"
    set background=dark
    colorscheme pompeii
    redraw
else 
    let g:curswtheme="default"
    set background=dark
    colorscheme bogster
    redraw
endif
endfunction

syntax on
call SwitchDarkLightThemes()

function! SynStack()
    if !exists("*synstack")
        echoerr "Not available. Unsupported 'syntack'."
        return
    endif
    let stack = synstack(line('.'), col('.'))
    if len(stack) == 0
        echo "No syntax group under cursor."
        return
    endif
    let chainTail = synIDattr(synIDtrans(stack[-1]), "name")
    let chain = map(stack, 'synIDattr(v:val, "name")')
    echo join(chain, "->") . "=>" . chainTail
endfunc

function IncreaseFontSize(changeAmount)
   let l:fontsize=&guifont[stridx(&guifont, ':h')+2:]
   let l:fontname=&guifont[0:stridx(&guifont, ':h')+1]
   let l:newfontsize=l:fontsize+a:changeAmount
   let l:newfont=l:fontname.l:newfontsize
   if exists(":GuiFont")
       :execute 'GuiFont! '.l:newfont
   else
       :execute 'set guifont='.escape(l:newfont," ")
   endif
endfunction
