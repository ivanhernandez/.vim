let mapleader = "\<Space>"

let g:camelcasemotion_key = '<leader>'
nnoremap <silent> <leader><esc> <esc>:noh<CR>:echo ""<CR>
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <C-Backspace> diwi
inoremap <silent> <C-Backspace> <esc>diwi

nnoremap <silent> <leader>/ :Commentary<Esc>
vnoremap <silent> <leader>/ :Commentary<Esc>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)


nnoremap <silent> <C-/> :NERDTreeToggle<CR>
nnoremap <silent> <C-_> :NERDTreeToggle<CR>
nnoremap <silent> <leader><C-/> :NERDTreeFind<CR>
nnoremap <silent> <leader><C-_> :NERDTreeFind<CR>
nnoremap <silent> <A-CR> :let g:neovide_fullscreen=!g:neovide_fullscreen<CR>

if has("nvim")
nnoremap <C-P><C-P> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-P><C-S-P> :Telescope live_grep<CR>
nnoremap <C-P>/ :Telescope search_history<CR>
nnoremap <C-P>: :Telescope commands<CR>
nnoremap <C-P>; :Telescope command_history<CR>
nnoremap <C-P>b :Telescope buffers<CR>
nnoremap <C-P>c :Telescope colorscheme<CR>
nnoremap <C-P>f :Telescope file_browser<CR>
nnoremap <C-P>h :Telescope oldfiles<CR>
nnoremap <C-P>k :Telescope keymaps<CR>
nnoremap <C-P>l :Telescope highlights<CR>
nnoremap <C-P>m :Telescope marks<CR>
nnoremap <C-P>r :Telescope registers<CR>
nnoremap <C-P>t :Telescope filetypes<CR>
nnoremap <C-P>x :Telescope highlights<CR>
nnoremap <silent> <C-P><space> :Telescope lsp_documents_symbols<CR>
inoremap <silent> <C-P><space> <esc>:Telescope lsp_documents_symbols<CR>==gi
else
nnoremap <C-P><C-P> :BLines!<CR>
nnoremap <C-P><C-S-P> :Lines!<CR>
nnoremap <C-P>/ :History/<CR>
nnoremap <C-P>: :History:<CR>
nnoremap <C-P>; :History:<CR>
nnoremap <C-P>b :Buffers<CR>
nnoremap <C-P>f :Files<CR>
nnoremap <C-P>g :Rg!<Space>
nnoremap <C-P>h :History<CR>
nnoremap <C-P>t :Filetypes<CR>
nnoremap <C-P>w :Windows<CR>
endif

nnoremap <silent> <C-P><C-X> :call SwitchDarkLightThemes()<CR>

nnoremap <C-G><C-G> :Gina<space>
nnoremap <C-G>a :Gina add %<CR>
nnoremap <C-G><C-A> :Gina add .<CR>
nnoremap <C-G>r :Gina restore --staged %<CR>
nnoremap <C-G><C-R> :Gina restore --staged .<CR>
if has("nvim")
nnoremap <C-G>b :Telescope git_branches<CR>
nnoremap <C-G>s :Telescope git_status<CR>
nnoremap <C-G>h :Telescope git_commits<CR>
else
nnoremap <C-G>b :Gina branch<CR>
nnoremap <C-G>s :Gina status<CR>
nnoremap <C-G>h :Gina log<CR>
endif

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

if has("nvim")
    inoremap <silent><expr> <C-Space> compe#complete()
    inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    inoremap <silent><expr> <C-e>     compe#close('<C-e>')
    inoremap <silent><expr> <C-u>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
    inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr> <C-b>     compe#scroll({ 'delta': -4 })
endif

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
nnoremap <silent> <Leader>x :call SynStack()<CR>h 


