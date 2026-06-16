local github = function(x) return 'https://github.com/' .. x end

vim.pack.add {
    { src = github 'nvim-mini/mini.nvim' }
}

require('mini.ai').setup()
require('mini.align').setup()
require('mini.comment').setup()
require('mini.jump').setup()
require('mini.jump2d').setup()
require('mini.move').setup()
require('mini.surround').setup()

require('mini.icons').setup()
require('mini.snippets').setup()
require('mini.completion').setup()
