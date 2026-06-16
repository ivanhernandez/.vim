
-- SPECIAL ESCAPE ACTIONS
vim.keymap.set('t', '<S-esc>', '<C-\\><C-N>', { silent = true, desc = 'Change to Normal Mode' })
vim.keymap.set('i', '<S-esc>', '<esc>:nohlsearch<CR>:echo ""<CR>', { silent = true, desc = 'Hide Search Highlights' })
vim.keymap.set('n', '<S-esc>', '<esc>:nohlsearch<CR>:echo ""<CR>', { silent = true, desc = 'Hide Search Highlights' })
vim.keymap.set('n', '<leader><esc>', '<esc>:nohlsearch<CR>:echo ""<CR>', { silent = true, desc = 'Hide Search Highlights' })

-- BUFFERS AND WINDOWS
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', { silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<C-S-Tab>', ':bprevious<CR>', { silent = true, desc = 'Prev. Buffer' })
vim.keymap.set('n', '<Tab><Tab>', ':bnext<CR>', { silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab><S-Tab>', ':bprevious<CR>', { silent = true, desc = 'Prev. Buffer' })
vim.keymap.set('n', '<S-Tab><Tab>', ':bprevious<CR>', { silent = true, desc = 'Prev. Buffer' })
vim.keymap.set('n', '<Tab><S-Tab>', ':bprevious<CR>', { silent = true, desc = 'Prev. Buffer' })
vim.keymap.set('n', '<Tab>w', ':wincmd w<CR>', { silent = true, desc = 'Switch Window' })

-- SPLIT LINE AT CURSOR AND JOIN WHEN DELETING FROM FIRST COLUMN
vim.keymap.set('n', 'K', 'i<CR><esc>', { silent = true, desc = 'Split Line' })
vim.keymap.set('n', 'X', function()
	    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 and row > 1 then
          vim.api.nvim_feedkeys('kJ', 'n', false)
	    else
          vim.api.nvim_feedkeys('X', 'n', false)
		end
	end,
	{ silent = true, desc = 'Backspace' })

-- WORD REMOVE
-- vim.keymap.set('n', '<C-Backspace>', ':undojoin<CR>"_db', { silent = true, desc = 'Remove previous word' }) -- no yank
vim.keymap.set('n', '<C-Backspace>', function()
        local _, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()
        local char = line:sub(col+1, col+1)
        if string.match(char, '%s') or string.match(char, '%p') then
            vim.api.nvim_feedkeys('db', 'n', false)
        else
            vim.api.nvim_feedkeys('diw', 'n', false)
        end
    end,
    { silent = true, desc = 'Delete Prev. Word' })
vim.keymap.set('i', '<C-Backspace>', '<C-w>', { silent = true, desc = 'Delete Prev. Word' })

-- YANK BEHAVIOUR
-- No yank for single character deletions. Explicit yanking with leader key.
-- or in visual mode when substituting selection
vim.keymap.set('n', '<leader>x', 'x', { desc = 'Delete Current Char' })
vim.keymap.set('n', '<leader>X', 'X', { desc = 'Delete Prev. Char' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete Current Char (no yank)' })
vim.keymap.set('n', 'X', '"_X', { desc = 'Delete Prev. Char (no yank)' })
-- Yank whole line instead of yanking until eol
vim.keymap.set('n', 'Y', 'myVy`y', { remap = true, desc = 'Yank Line' })
-- No yank when pasting over selection. Explicit yanking with leader.
vim.keymap.set('v', '<leader>p', 'p', { desc = 'Paste and Yank' })
vim.keymap.set('v', 'p', '"_dp', { desc = 'Paste (no yank)' })

-- Avoid yanking with leader key for deletions 
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete (no yank)'})
-- In normal/visual mode, leader yanking and pasting uses System Clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to Clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = 'Yank to Clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from Clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste from Clipboard' })

-- SOFT SCROLL
vim.keymap.set({ 'n', 'v' }, '<C-j>', '4<C-e>', { silent = true, desc = 'Soft Scroll Down' })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '4<C-y>', { silent = true, desc = 'Soft Scroll Up' })
vim.keymap.set({ 'n', 'v' }, '<C-up>', '4<C-e>', { silent = true, desc = 'Soft Scroll Down' })
vim.keymap.set({ 'n', 'v' }, '<C-down>', '4<C-y>', { silent = true, desc = 'Soft Scroll Up' })

-- SEARCH
vim.keymap.set({ 'x' }, 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })
vim.keymap.set({ 'n', 'v' }, '<A-w>', '<Leader>w', { silent = true, desc = 'Search word in screen' })
vim.keymap.set({ 'n', 'v' }, '<Leader>w', ':lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<CR>', { silent = true, desc = 'Search word in screen' })

-- LINE MOVEMENT
-- A-j and A-k are handled by mini, which moves blocks of code by caring about indentation.
-- These mappings move lines regardless of indentation, which is more intuitive, sometimes.
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { silent = true, desc = 'Move Line Down' })
vim.keymap.set('v', '<A-Down>', ':m \'>+1<CR>gv=gv', { silent = true, desc = 'Move Lines Down' })
vim.keymap.set('i', '<A-Down>', '<esc>:m .+1<CR>==gi', { silent = true, desc = 'Move Line Down' })
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { silent = true, desc = 'Move Line Up' })
vim.keymap.set('v', '<A-Up>', ':m \'<-2<CR>gv=gv', { silent = true, desc = 'Move Line Up' })
vim.keymap.set('i', '<A-Up>', '<esc>:m .-2<CR>==gi', { silent = true, desc = 'Move Line Up' })

-- COLORSCHEME AND FONT
vim.keymap.set('n', '<leader>C', switchDarkLightThemes, { silent = true, desc = 'Switch Color Scheme' })
-- TODO vim.keymap.set('n', '<leader>ic', ':call SynStack()<CR>', { silent = true })
vim.keymap.set('n', '<C-->', function() ChangeFontSize(-1) end, { silent = true, desc = 'Decrease Font Size' })
vim.keymap.set('n', '<C-=>', function() ChangeFontSize(1) end, { silent = true, desc = 'Increase Font Size' })

-- BASE 64 ENCODING
vim.keymap.set('n', '<Leader>Ee', "Y:echo system('base64 -e', @\")<CR>", { silent = true, desc = 'Encode Base64' })
vim.keymap.set('v', '<Leader>Ee', "y:let @\"=system('base64 -e', @\")<CR>gvP", { silent = true, desc = 'Encode Base64' })
vim.keymap.set('n', '<Leader>Ed', "Y:echo system('base64 -d', @\")<CR>", { silent = true, desc = 'Decode Base64' })
vim.keymap.set('v', '<Leader>Ed', "y:let @\"=system('base64 -d', @\")<CR>gvP", { silent = true, desc = 'Decode Base64' })

-- FILE TREE
vim.keymap.set('n', '<C-\\>', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle NivmTree' })
vim.keymap.set('n', '<C-/>', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<C-_>', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader><C-\\>', ':NvimTreeFindFile<CR>', { silent = true, desc = 'Open NvimTree at File' })
vim.keymap.set('n', '<leader><C-/>', ':NvimTreeFindFile<CR>', { silent = true, desc = 'Open NvimTree at File' })
vim.keymap.set('n', '<leader><C-_>', ':NvimTreeFindFile<CR>', { silent = true, desc = 'Open NvimTree at File' })
vim.keymap.set('n', '<A-CR>', function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end, { silent = true, desc = 'Toggle FullScreen' })

-- TELESCOPE
vim.keymap.set('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Fuzzy Find in Buffer'})
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', { desc = 'Find in files (RipGrep)' })
vim.keymap.set('n', '<leader>:', ':Telescope commands<CR>', { desc = 'Show Commands'})
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { desc = 'Show Buffers' } )
vim.keymap.set('n', '<leader>c', ':Telescope colorscheme<CR>', { desc = 'Show Color Schemes' })
vim.keymap.set('n', '<leader>f', ':Telescope fd<CR>', { desc = 'Show Files' })
vim.keymap.set('n', '<leader>F', ':Telescope file_browser<CR>', { desc = 'Browse Files' })
vim.keymap.set('n', '<leader>H', ':Telescope help_tags<CR>', { desc = 'Show Help Tags' })
vim.keymap.set('n', '<leader>hh', ':Telescope help_tags<CR>', { desc = 'Show Help Tags' })
vim.keymap.set('n', '<leader>hk', ':Telescope keymaps<CR>', { desc = 'Show Keymaps' })
vim.keymap.set('n', '<leader>hf', ':Telescope oldfiles<CR>', { desc = 'Show Files History' })
vim.keymap.set('n', '<leader>hn', ':Telescope notify<CR>', { desc = 'Show Notifications/Messages' })
vim.keymap.set('n', '<leader>h:', ':Telescope command_history<CR>', { desc = 'Show Commands History' })
vim.keymap.set('n', '<leader>h/', ':Telescope search_history<CR>', { desc = 'Show Search History' })
vim.keymap.set('n', '<leader>j', ':Telescope jumplist<CR>', { desc = 'Show Jumps' })
vim.keymap.set('n', '<leader>m', ':Telescope marks<CR>', { desc = 'Show Marks' })
vim.keymap.set('n', '<leader>r', ':Telescope registers<CR>', { desc = 'Show Registers' })
vim.keymap.set('n', '<leader>s', ':Telescope symbols<CR>', { desc = 'Show Symbols' })
vim.keymap.set('n', '<leader>t', ':Telescope filetypes<CR>', { desc = 'Show Files Types'})
vim.keymap.set('n', '<leader>u', ':UrlView<CR>', { desc = 'Show Urls'})
-- vim.keymap.set('n', '<leader>ix', ':Telescope highlights<CR>')
vim.keymap.set('n', '<C-P><space>', ':Telescope lsp_documents_symbols<CR>', { silent = true, desc = 'Show Document Symbols' })
vim.keymap.set('i', '<C-P><space>', '<esc>:Telescope lsp_documents_symbols<CR>==gi', { silent = true, desc = 'Show Document Symbols' })

-- GIT / GINA
vim.keymap.set('n', '<C-G><C-G>', ':Gina<space>', { desc = "Gina ..."})
vim.keymap.set('n', '<C-G>a', ':Gina add %<CR>', { desc = "Stage Buffer" })
vim.keymap.set('n', '<C-G><C-A>', ':Gina add .<CR>', { desc = "Stage All" })
vim.keymap.set('n', '<C-G>r', ':Gina restore --staged %<CR>', { desc = "Unstage Buffer" })
vim.keymap.set('n', '<C-G><C-R>', ':Gina restore --staged .<CR>', { desc = "Unstage All" })
vim.keymap.set('n', '<C-G>b', ':Telescope git_branches<CR>', { desc = "Show Branches"})
vim.keymap.set('n', '<C-G>s', ':Telescope git_status<CR>', { desc = "Show Status" })
vim.keymap.set('n', '<C-G>h', ':Telescope git_commits<CR>', { desc = "Show Commits"})

-- CODE FORMATTING
vim.keymap.set('n', '<leader>kc', 'gcc', { silent = true, desc = 'Comment/Uncomment' })
vim.keymap.set('v', '<leader>kc', 'gc', { silent = true, desc = 'Comment/Uncomment' })

-- CODE COMPLETION AND DIAGNOSTICS
vim.keymap.set('n', '<leader>kt', '<cmd>Trouble lsp_type_definitions<CR>', { desc = 'Show Type Definitions' })
vim.keymap.set('n', '<leader>kd', '<cmd>Trouble lsp_definitions<CR>', { desc = 'Show Definitions' })
vim.keymap.set('n', '<leader>kD', vim.lsp.buf.definition, { desc = 'Definition (lsp)'})
vim.keymap.set('n', '<leader>ki', '<cmd>Trouble lsp_implementations<CR>', { desc = 'Show Implementations' })
vim.keymap.set('n', '<leader>kI', vim.lsp.buf.implementation, { desc = 'Implementation (lsp)' })
vim.keymap.set('n', '<leader>kh', vim.lsp.buf.hover, { desc = 'Show Information' })
vim.keymap.set('n', '<leader>ks', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
vim.keymap.set('n', '<leader>kr', '<cmd>Trouble lsp_references<CR>', { desc = 'View References' })
vim.keymap.set('n', '<leader>kR', vim.lsp.buf.references, { desc = 'References (lsp)' })
vim.keymap.set('n', '<leader>kl', '<cmd>Trouble loclist<CR>', { desc = 'Show Locations'})
--vim.keymap.set('n', '<leader>kL', LspLocationList)
vim.keymap.set('n', '<leader>kn', vim.lsp.buf.rename, { desc = 'Rename'})
vim.keymap.set('n', '<leader>ka', vim.lsp.buf.code_action, { desc = 'Code Actions' })
vim.keymap.set('n', '<leader>kq', '<cmd>Trouble quickfix<CR>', { desc = 'Quick fix' })
vim.keymap.set('n', '<leader>kk', '<cmd>Trouble workspace_diagnostics<CR>', { desc = 'Workspace Diagnostics' })
vim.keymap.set('n', '<leader>kK', '<cmd>TroubleClose<CR>', { desc = 'Close diagnostics window' })
vim.keymap.set('n', '<leader>kg', vim.diagnostic.open_float, { desc = 'Show Line Diagnostics' })
vim.keymap.set('n', '<leader>ke', 'hl<cmd>lua vim.diagnostic.jump({count = 1, on_jump = function(di,x) vim.diagnostic.open_float() end})<CR>', { desc = 'Next Diagnostic' } )
vim.keymap.set('n', '<leader>kE', 'hl<cmd>lua vim.diagnostic.jump({count = -1, on_jump = function(di,x) vim.diagnostic.open_float() end})<CR>', { desc = 'Prev. Diagnostic' })

local miniclue = require 'mini.clue'
miniclue.setup {
    triggers = {
        { mode = {'n', 'x'}, keys = '<Leader>' },
        { mode = {'n', 'x'}, keys = 'g' },
        { mode = {'n', 'x'}, keys = '<C-G>' },
        { mode = 'n', keys = 'z' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'i', keys = '<C-x>' },
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },
        { mode = {'n', 'x'}, keys = 'd' },
        { mode = {'n', 'x'}, keys = 'c' },
        { mode = {'n', 'x'}, keys = 'y' },
        { mode = {'n', 'x'}, keys = '<C-W>' },
    },
    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.g(),
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        --miniclue.gen_clues.d(),
        --miniclue.gen_clues.c(),
        --miniclue.gen_clues.y(),

        { mode = {'n', 'x'}, keys = '<Leader>E', desc = '+ENCODE/DECODE' },
        { mode = {'n', 'x'}, keys = '<Leader>h', desc = '+HELP AND HISTORY' },
        { mode = {'n', 'x'}, keys = '<C-G>', desc = '+GIT' },
        { mode = 'n', keys = '<Leader>k', desc = '+CODE' },
    },
}
