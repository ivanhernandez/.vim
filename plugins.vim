call plug#begin('~/.vim/plugged')

" Musts
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak' " Using incsearch hlsearch should Ok. Substitute lines with 'cc' instead of 'S'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'voldikss/vim-floaterm'
Plug 'rcarriga/nvim-notify'

" Themes
Plug 'ivanhernandez/pompeii'
Plug 'wojciechkepka/bogster'
Plug 'sdothum/vim-colors-duochrome'

" Niceties
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'ap/vim-css-color'
Plug 'lambdalisue/gina.vim'
Plug 'sindrets/diffview.nvim'
Plug 'nicwest/vim-http'
" Plug 'NTBBloodbath/rest.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Auto Completion/LSP 

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Lots of syntax files
" Disable languages as needed: let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Log files
"POLYGLOT Plug 'MTDL9/vim-log-highlighting'
" Lua
" Plug 'tjdevries/nlua.nvim' " SUMNEKO IS SHITTY
" Markdown -- depends on node and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" C#
"POLYGLOT Plug 'OmniSharp/omnisharp-vim'
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

