call plug#begin('~/.vim/plugged')

" Musts
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
" Plug 'justinmk/vim-sneak' " Using incsearch hlsearch is just Ok
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
if has("nvim")
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
else
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
endif
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Themes
Plug 'ivanhernandez/pompeii'
Plug 'wojciechkepka/bogster' 
Plug 'sdothum/vim-colors-duochrome'

" Niceties
Plug 'folke/which-key.nvim'
Plug 'ap/vim-css-color'
Plug 'lambdalisue/gina.vim'
Plug 'sindrets/diffview.nvim'
Plug 'nicwest/vim-http'
if has("nvim")
    " Plug 'NTBBloodbath/rest.nvim'
    Plug 'lewis6991/gitsigns.nvim'
endif

" Auto Completion/LSP 

if has("nvim")
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'ray-x/lsp_signature.nvim'
endif

" Lots of syntax files
" Disable languages as needed: let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'

" Log files
"POLYGLOT Plug 'MTDL9/vim-log-highlighting'
" Lua
Plug 'tjdevries/nlua.nvim'
" Markdown -- depends on node and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Go
"POLYGLOT Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
" FLutter
"POLYGLOT Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
" Rescript
Plug 'rescript-lang/vim-rescript'
" Rust
"POLYGLOT Plug 'rust-lang/rust.vim'
" V
"POLYGLOT Plug 'ollykel/v-vim'
Plug 'zakuro9715/vim-vtools' 
"POLYGLOT Plug 'ziglang/vim'

call plug#end()

