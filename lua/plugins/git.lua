local github = function(x) return 'https://github.com/' .. x end

vim.pack.add {
     { src = github 'lambdalisue/gina.vim' }
    ,{ src = github 'sindrets/diffview.nvim' }
    ,{ src = github 'lewis6991/gitsigns.nvim' }
}
