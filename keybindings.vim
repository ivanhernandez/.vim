let mapleader = "\<Space>"

let g:camelcasemotion_key = '\'
tnoremap <silent> <S-esc> <C-\><C-N>
nnoremap <silent> <leader><esc> <esc>:noh<CR>:echo ""<CR>
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <C-S-Tab> :bprevious<CR>
nnoremap <silent> <Tab><Tab> :bnext<CR>
nnoremap <silent> <Tab><S-Tab> :bprevious<CR>
nnoremap <silent> <S-Tab><S-Tab> :bprevious<CR>
nnoremap <silent> <Tab>w :wincmd w<CR>

" Split line at cursor
nnoremap <silent> K i<CR><esc>

" Remove previous word. Do not yank.
nnoremap <silent> <C-Backspace> :undojoin<CR>"_db
inoremap <silent> <C-Backspace> <C-w>
" No yank for single character deletions. Explicit yanking with leader key.
" or in visual mode when substituting selection
nnoremap <leader>x x
nnoremap <leader>X X
nnoremap x "_x
nnoremap X "_X
" Yank whole line instead of yanking until eol
nmap Y myVy`y
" No yank when pasting over selection. Explicit yanking with leader.
vnoremap <leader>p p
vnoremap p "_dP
" Avoid yanking with leader key for deletions 
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" In normal/visual mode, leader yanking and pasting uses System Clipboard
vnoremap <leader>y "+y
vnoremap <leader>Y "+Y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

nnoremap <silent> <C-j> 3<C-e>
vnoremap <silent> <C-j> 3<C-e>
nnoremap <silent> <C-k> 3<C-y>
vnoremap <silent> <C-k> 3<C-y>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nnoremap <silent> <C-\> :NvimTreeToggle<CR>
nnoremap <silent> <C-/> :NvimTreeToggle<CR>
nnoremap <silent> <C-_> :NvimTreeToggle<CR>
nnoremap <silent> <leader><C-\> :NvimTreeFindFile<CR>
nnoremap <silent> <leader><C-/> :NvimTreeFindFile<CR>
nnoremap <silent> <leader><C-_> :NvimTreeFindFile<CR>
nnoremap <silent> <A-CR> :let g:neovide_fullscreen=!g:neovide_fullscreen<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, NvimTreeRefresh and NvimTreeResize are also available if you need them

nnoremap <leader>/ :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>g :Telescope live_grep<CR>
nnoremap <leader>: :Telescope commands<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>c :Telescope colorscheme<CR>
nnoremap <leader>f :Telescope fd<CR>
nnoremap <leader>F :Telescope file_browser<CR>
nnoremap <leader>H :Telescope help_tags<CR>
nnoremap <leader>hh :Telescope help_tags<CR>
nnoremap <leader>hk :Telescope keymaps<CR>
nnoremap <leader>hf :Telescope oldfiles<CR>
nnoremap <leader>hn :Telescope notify<CR>
nnoremap <leader>h: :Telescope command_history<CR>
nnoremap <leader>h/ :Telescope search_history<CR>
nnoremap <leader>j :Telescope jumplist<CR>
nnoremap <leader>m :Telescope marks<CR>
nnoremap <leader>r :Telescope registers<CR>
nnoremap <leader>s :Telescope symbols<CR>
nnoremap <leader>t :Telescope filetypes<CR>
" nnoremap <leader>ix :Telescope highlights<CR>
nnoremap <silent> <C-P><space> :Telescope lsp_documents_symbols<CR>
inoremap <silent> <C-P><space> <esc>:Telescope lsp_documents_symbols<CR>==gi

nnoremap <silent> <C-P><C-E>e Y:echo system('base64 -e', @")<CR>
vnoremap <silent> <C-P><C-E>e y:let @"=system('base64 -e', @")<CR>gvP
nnoremap <silent> <C-P><C-E>d Y:echo system('base64 -d', @")<CR>
vnoremap <silent> <C-P><C-E>d y:let @"=system('base64 -d', @")<CR>gvP

nnoremap <silent> <leader>C :call SwitchDarkLightThemes()<CR>
nnoremap <silent> <Leader>ic :call SynStack()<CR>h 
if has("nvim")
    nnoremap <silent> <C--> :call IncreaseFontSize(-1)<CR>
    nnoremap <silent> <C-=> :call IncreaseFontSize(1)<CR>
endif

nnoremap <C-G><C-G> :Gina<space>
nnoremap <C-G>a :Gina add %<CR>
nnoremap <C-G><C-A> :Gina add .<CR>
nnoremap <C-G>r :Gina restore --staged %<CR>
nnoremap <C-G><C-R> :Gina restore --staged .<CR>
nnoremap <C-G>b :Telescope git_branches<CR>
nnoremap <C-G>s :Telescope git_status<CR>
nnoremap <C-G>h :Telescope git_commits<CR>

nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi


" KEY BINDINGS FOR CMP MOVED INTO CMP SETTINGS
" inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-k>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-u>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-b>     compe#scroll({ 'delta': -4 })

"    nnoremap <silent><C-k><C-i> :Lspsaga hover_doc<CR>
"    nnoremap <silent><C-k><C-s> :Lspsaga signature_help<CR>
"    nnoremap <silent><C-k><C-f> :Lspsaga lsp_finder<CR>

nnoremap <silent> <leader>kc :Commentary<Esc>
vnoremap <silent> <leader>kc :Commentary<Esc>
nnoremap <leader>kt <cmd>TroubleToggle lsp_type_definitions<CR>
nnoremap <leader>kd <cmd>TroubleToggle lsp_definitions<CR>
nnoremap <leader>kD :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>ki <cmd>TroubleToggle lsp_implementations<CR>
nnoremap <leader>kI :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>kh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ks :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>kr <cmd>TroubleToggle lsp_references<CR>
nnoremap <leader>kR :lua vim.lsp.buf.references()<CR>
nnoremap <leader>kl <cmd>TroubleToggle loclist<CR>
nnoremap <leader>kL :lua LspLocationList()<CR>
nnoremap <leader>ke  :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ka :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>kk <cmd>TroubleToggle<CR>
nnoremap <leader>km <cmd>TroubleToggle document_diagnostics<CR>
nnoremap <leader>kw <cmd>TroubleToggle workspace_diagnostics<CR>
nnoremap <leader>kq <cmd>TroubleToggle quickfix<CR>
nnoremap <leader>kT <cmd>TroubleToggle telescope<CR>
nnoremap <leader>kg :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>kn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>kN :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>kp :lua vim.lsp.diagnostic.goto_prev()<CR>

