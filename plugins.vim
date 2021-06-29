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
else
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
endif
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Themes
Plug 'wojciechkepka/bogster' 
Plug 'sdothum/vim-colors-duochrome'

" Niceties
Plug 'folke/which-key.nvim'
Plug 'ap/vim-css-color'
Plug 'nicwest/vim-http'
Plug 'lambdalisue/gina.vim'
if has("nvim")
Plug 'lewis6991/gitsigns.nvim'
endif

" Auto Completion/LSP 

if has("nvim")
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
" DOES NOT WORK Plug 'ray-x/lsp_signature.nvim'
endif

" Log files
Plug 'MTDL9/vim-log-highlighting'
" Lua
Plug 'tjdevries/nlua.nvim'
" Markdown -- depends on node and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Go
Plug 'fatih/vim-go'
" FLutter
Plug 'akinsho/flutter-tools.nvim'
" Rust
Plug 'rust-lang/rust.vim'
" V
Plug 'ollykel/v-vim'
Plug 'zakuro9715/vim-vtools' 

call plug#end()

