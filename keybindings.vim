let mapleader = "\<Space>"

let g:camelcasemotion_key = '<leader>'
nnoremap <silent> <leader><esc> <esc>:noh<CR>:echo ""<CR>
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <C-S-Tab> :bprevious<CR>
nnoremap <silent> <Tab><Tab> :bnext<CR>
nnoremap <silent> <Tab><S-Tab> :bprevious<CR>
nnoremap <silent> <S-Tab><S-Tab> :bprevious<CR>
nnoremap <silent> <Tab>w :wincmd w<CR>


" Remove previous word. Do not yank.
nnoremap <silent> <C-Backspace> :undojoin<CR>"_db
inoremap <silent> <C-Backspace> <C-w>
" No yank for single character deletions. Explicit yanking with leader key.
" or in visual mode when substituting selection
nnoremap <leader>x x
nnoremap <leader>X X
nnoremap x "_x
nnoremap X "_X
" No yank when pasting over selection. Explicit yanking with leader.
vnoremap <leader>p p
vnoremap p "_dP
" Avoid yanking with leader key for deletions 
nnoremap <leader>d "_d
vnoremap <leader>d "_d


nnoremap <silent> <leader>/ :Commentary<Esc>
vnoremap <silent> <leader>/ :Commentary<Esc>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nnoremap <silent> <C-/> :NvimTreeToggle<CR>
nnoremap <silent> <C-_> :NvimTreeToggle<CR>
nnoremap <silent> <leader><C-/> :NvimTreeFindFile<CR>
nnoremap <silent> <leader><C-_> :NvimTreeFindFile<CR>
nnoremap <silent> <A-CR> :let g:neovide_fullscreen=!g:neovide_fullscreen<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, NvimTreeRefresh and NvimTreeResize are also available if you need them

nnoremap <C-P><C-P> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-P><C-S-P> :Telescope live_grep<CR>
nnoremap <C-P>/ :Telescope search_history<CR>
nnoremap <C-P>: :Telescope commands<CR>
nnoremap <C-P>; :Telescope command_history<CR>
nnoremap <C-P>b :Telescope buffers<CR>
nnoremap <C-P>c :Telescope colorscheme<CR>
nnoremap <C-P>f :Telescope fd<CR>
nnoremap <C-P>F :Telescope file_browser<CR>
nnoremap <C-P>h :Telescope oldfiles<CR>
nnoremap <C-P>j :Telescope jumplist<CR>
nnoremap <C-P>k :Telescope keymaps<CR>
nnoremap <C-P>l :Telescope highlights<CR>
nnoremap <C-P>m :Telescope marks<CR>
nnoremap <C-P>r :Telescope registers<CR>
nnoremap <C-P>s :Telescope symbols<CR>
nnoremap <C-P>t :Telescope filetypes<CR>
nnoremap <C-P>x :Telescope highlights<CR>
nnoremap <silent> <C-P><space> :Telescope lsp_documents_symbols<CR>
inoremap <silent> <C-P><space> <esc>:Telescope lsp_documents_symbols<CR>==gi

nnoremap <silent> <C-P><C-E>e Y:echo system('base64 -e', @")<CR>
vnoremap <silent> <C-P><C-E>e y:let @"=system('base64 -e', @")<CR>gvP
nnoremap <silent> <C-P><C-E>d Y:echo system('base64 -d', @")<CR>
vnoremap <silent> <C-P><C-E>d y:let @"=system('base64 -d', @")<CR>gvP

nnoremap <silent> <C-P><C-X> :call SwitchDarkLightThemes()<CR>
nnoremap <silent> <Leader>x :call SynStack()<CR>h 
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
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-k>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-u>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-b>     compe#scroll({ 'delta': -4 })

"    nnoremap <silent><C-k><C-i> :Lspsaga hover_doc<CR>
"    nnoremap <silent><C-k><C-s> :Lspsaga signature_help<CR>
"    nnoremap <silent><C-k><C-f> :Lspsaga lsp_finder<CR>

nnoremap <leader>kd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>ki :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>ks :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>kr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>kR :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>kh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ka :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>kg :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>kn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>kN :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>kl :lua LspLocationList()<CR>

