local github = function(x) return 'https://github.com/' .. x end

vim.pack.add {
	 { src = github 'neovim/nvim-lspconfig' }
    -- COMPLETION
    --[[
	,{ src = github 'hrsh7th/cmp-nvim-lsp' }
	,{ src = github 'hrsh7th/cmp-buffer' }
	,{ src = github 'hrsh7th/cmp-cmdline' }
	,{ src = github 'hrsh7th/cmp-emoji' }
	,{ src = github 'hrsh7th/cmp-nvim-lsp-document-symbol' }
	,{ src = github 'hrsh7th/cmp-path' }
	,{ src = github 'hrsh7th/nvim-cmp' }
	,{ src = github 'ray-x/lsp_signature.nvim' }
--	,{ src = github 'glepnir/lspsaga.nvim' }
    --]]
}

--[[
local cmp = require 'cmp'
cmp.setup{
  preselect = true,
  confirmation = { completeopt = 'menu,menuone,noselect' },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-3),
      ['<C-f>'] = cmp.mapping.scroll_docs(3),
      ['<C-d>'] = cmp.mapping.scroll_docs(-3),
      ['<C-u>'] = cmp.mapping.scroll_docs(3),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-h>'] = cmp.mapping.complete(),
      --['<esc>'] = cmp.mapping.close(),  -- This is a bit annoying
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   }),
   sources = cmp.config.sources{
     { name = 'nvim_lsp' },
     { name = 'path' },
     { name = 'buffer' },
     { name = 'crates' },
     { name = 'emoji' },
   }
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ src = github '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup signature
require 'lsp_signature' .setup {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",   -- log dir when debug is on
                                                                -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 6, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = -1, -- adjust float windows x position.
  floating_window_off_y = 0, -- adjust float windows y position.


  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = false, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 10, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 60, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {"(", ","}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

--]]


---- EVAL THIS: folke/lazydev.nvim	for LuaLS
--	
--    -- SYNTAX
--
vim.pack.add {
     { src = github 'windwp/nvim-ts-autotag' }
    ,{ src = github 'nvim-treesitter/nvim-treesitter' }
    --,{ src = github 'nvim-treesitter/playground' }
}

require 'nvim-treesitter'.setup {
  auto_install = false,
  ensure_installed = {
    'kotlin',
    'java',
    'javascript',
    'typescript',
    'html',
    'json',
    'css',
    'rust',
    'lua',
    'go',
    'markdown',
    'nix',
    'proto',
    'zig',
    'diff'
  },
  highlight = { enable = true },
  indent = { enable = true },
}
-- THIS WAS IN THE CONFIGS
--	  main = 'nvim-treesitter.configs',
--      build = ':TSUpdate',
--      event = 'BufReadPost',
--      opts = {
--        auto_install = false,
--        ensure_installed = {
--          'kotlin',
--          'java',
--          'javascript',
--          'typescript',
--          'html',
--          'json',
--          'css',
--          'rust',
--          'lua',
--          'go',
--          'markdown',
--          'nix',
--          'proto',
--          'zig',
--          'diff'
--        },
--        highlight = { enable = true },
--        indent = { enable = true },
--      }
--	}
--}

vim.pack.add {
    { src = github 'saecki/crates.nvim' }
}

--	-- SYNTAX PLUGINS
--vim.pack.add {
--	-- Deprecate Polyglot and use Syntax Plugins directly
--    -- ,{ src = github 'sheerun/vim-polyglot' }
--	
--	 { src = github 'hnamikaw/vim-autohotkey' }
--	,{ src = github 'carlsmedstad/vim-bicep' }
--	,{ src = github 'OmniSharp/omnisharp-vim' }
--	,{ src = github 'bfrg/vim-cpp-modern' }
--	,{ src = github 'pboettch/vim-cmake-syntax' }
--	,{ src = github 'chrisbra/csv.vim' }
--	,{ src = github 'ekalinin/Dockerfile.vim' }
--	,{ src = github 'ionide/Ionide-vim' } --F#
--	,{ src = github 'tpope/vim-git' }
--	,{ src = github 'SirJson/fzf-gitignore' }
--	,{ src = github 'tikhomirov/vim-glsl' }
--	,{ src = github 'fatih/vim-go' }	
--	,{ src = github 'sebdah/vim-delve' }
--	,{ src = github 'jparise/vim-graphql' }
--	,{ src = github 'tpope/vim-haml' }
--	,{ src = github 'mustache/vim-mustache-handlebars' }
--	,{ src = github 'CH-DanReif/haproxy.vim' }
--	,{ src = github 'neovimhaskell/haskell-vim' }
--	,{ src = github 'towolf/vim-helm' }
--	,{ src = github 'othree/html5.vim' }
--	,{ src = github 'pangloss/vim-javascript' }
--	,{ src = github 'vito-c/jq.vim' }
--	,{ src = github 'GutenYe/json5.vim' }
--  ,{ src = github 'elzr/vim-json' }                            -- This only adds conceal of ", and I don't like it
--	,{ src = github 'neoclide/jsonc.vim' }
--	,{ src = github 'MaxMEllon/vim-jsx-pretty' }
--	,{ src = github 'udalov/kotlin-vim' }
--	,{ src = github 'rhysd/vim-llvm' }
--	,{ src = github 'MTDL9/vim-log-highlighting' }
--	,{ src = github 'tbastos/vim-lua' }
--	,{ src = github 'preservim/vim-markdown',
--        dependencies = {
--            'godlygeek/tabular',
--        },
--        config = function()
--               vim.g.markdown_fenced_languages = {'html', 'bash=sh', 'viml=vim' , 'ini=dosini', 'c', 'c++=cpp', 'csharp=cs', 'js=javascript'}
--        end,
--    }
--	,{ src = github 'iamcco/markdown-preview.nvim',
--        event = "BufRead",
--        build = function() vim.fn("mkdp#util#install") end  
--    } -- build = 'cd app && yarn install' }
--	,{ src = github 'mracos/mermaid.vim' }
--	,{ src = github 'petRUShka/vim-opencl' }
--	,{ src = github 'axvr/org.vim' }
--	,{ src = github 'aklt/plantuml-syntax' }
--	,{ src = github 'PProvost/vim-ps1' }
--	,{ src = github 'uarun/vim-protobuf' }
--	,{ src = github 'adamclerk/vim-razor' }
--	,{ src = github 'rust-lang/rust.vim' }
--    ,{ src = github 'simrat39/rust-tools.nvim', opts = {
--          tools = {
--            runnables = {
--              use_telescope = true,
--            },
--            inlay_hints = {
--              auto = true,
--              show_parameter_hints = false,
--              parameter_hints_prefix = "",
--              other_hints_prefix = "",
--            },
--          },
--
--          -- all the opts to send to nvim-lspconfig
--          -- these override the defaults set by rust-tools.nvim
--          -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
--          server = {
--            -- on_attach is a callback called when the language server attachs to the buffer
--            --on_attach = on_attach,
--            settings = {
--              -- to enable rust-analyzer settings visit:
--              -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--              ["rust-analyzer"] = {
--                -- enable clippy on save
--                checkOnSave = {
--                  command = "clippy",
--                },
--              },
--            },
--          },
--    }}
--    ,{
--        'saecki/crates.nvim',
--        event = { "BufRead Cargo.toml" },
--        tag = 'v0.4.0',
--        dependencies = { src = github 'nvim-lua/plenary.nvim' },
--        config = function()
--            require('crates').setup({
--                curl_args = { "-sL", "-k", "--retry", "1" },
--            })
--        end,
--    }
--    ,{ src = github 'lunacookies/vim-sh' }
--	,{ src = github 'leafOfTree/vim-svelte-plugin' }
--	,{ src = github 'vim-scripts/svg.vim' }
--	,{ src = github 'jasonshell/vim-svg-indent' }
--	,{ src = github 'hashivim/vim-terraform' }
--	,{ src = github 'cespare/vim-toml' }
--	,{ src = github 'HerringtonDarkholme/yats.vim' }
--	,{ src = github 'ziglang/zig.vim' }
--}

