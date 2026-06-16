local github = function(x) return 'https://github.com/' .. x end

vim.pack.add {
    { src = github 'bkad/CamelCaseMotion' }
    -- ,{ src = github 'mason-org/mason.nvim', opts = {} } -- prefer manual management of LSPs. How to setup empty opts with vim.pack?
    ,{ src = github 'voldikss/vim-floaterm' }
    ,{ src = github 'rcarriga/nvim-notify' }
    ,{ src = github 'folke/trouble.nvim' }
    ,{ src = github 'ap/vim-css-color' }
    ,{ src = github 'axieax/urlview.nvim' }
    ,{ src = github 'github/copilot.vim' }
}

require 'urlview'.setup {
    default_picker = "telescope",
    default_action = "system"
}

