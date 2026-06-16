local github = function(x) return 'https://github.com/' .. x end

vim.pack.add {
     { src = github 'nvim-telescope/telescope.nvim' }
    ,{ src = github 'nvim-telescope/telescope-file-browser.nvim' }
    ,{ src = github 'nvim-telescope/telescope-symbols.nvim' }
    ,{ src = github 'nvim-telescope/telescope-fzf-native.nvim' }
}
