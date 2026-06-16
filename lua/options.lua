vim.cmd('filetype plugin indent on') 

-- vim.o.nocompatible = true

vim.g.mapleader = " "
vim.g.camelcasemotion_key = '\\'
-- vim.g.vfmt = 0 --for V lang plugin

vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.guifont = 'Lilex:h14'
--vim.o.guifont = 'Rec Mono Duotone:h14'
--vim.o.guifont = 'Operator Mono Lig:h14'
--vim.o.guifont = 'New Heterodox Mono:h14'
--vim.o.guifont = 'GoMono NF:h14'

vim.o.backspace = 'indent,eol,start'
vim.o.hidden = true
vim.o.confirm = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.api.nvim_create_autocmd({ "InsertEnter" }, { callback = function() vim.o.hlsearch = false end })
vim.api.nvim_create_autocmd({ "InsertLeave" }, { callback = function() vim.o.hlsearch = true end })

vim.o.completeopt = 'menu,menuone,noselect'
vim.o.expandtab = true

vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.smartindent = true

vim.o.breakindent = true
vim.o.errorbells = false
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:␣,nbsp:·,extends:…,precedes:…'
vim.o.number = true
vim.o.relativenumber = false
vim.o.ruler = true
-- vim.o.shortmess:append("cCW") -- 'filnxtToOFc'
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 5
vim.o.splitbelow = true
vim.o.splitkeep = 'screen'
vim.o.splitright = true
vim.o.wrap = false

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true

vim.g.BASH_Ctrl_j = 'off'

vim.o.cursorline = true
local cursorLine_AuGroup = vim.api.nvim_create_augroup('CursorLineOnlyInActiveWindow', { clear = true })
vim.api.nvim_create_autocmd(
    { "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = cursorLine_AuGroup,
	callback = function() vim.o.cursorline = true end })
vim.api.nvim_create_autocmd(
    { "WinLeave" }, { 
	group = cursorLine_AuGroup,
	callback = function() vim.o.cursorline = false end })

vim.cmd('syntax on')

