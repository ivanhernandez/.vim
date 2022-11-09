local cmp = require 'cmp'

cmp.setup{
  preselect = true,
  confirmation = { completeopt = 'menu,menuone' },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
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
      ['<esc>'] = cmp.mapping.close(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   }),
   sources = cmp.config.sources{
     { name = 'nvim_lsp' },
     { name = 'vsnip' },
   }, {
     { name = 'buffer' },
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
cmp.setup.cmdline({ '/', '?' }, {
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


  -- cmp.setup.cmdline('/', {
-- sources = cmp.config.sources({
  -- { name = 'nvim_lsp_document_symbol' }
-- }, {
  -- { name = 'buffer' }
-- })

-- let g:compe = {}
-- let g:compe.enabled = v:true
-- let g:compe.autocomplete = v:true
-- let g:compe.debug = v:false
-- let g:compe.min_length = 1
-- let g:compe.preselect = 'enable'
-- let g:compe.throttle_time = 80
-- let g:compe.source_timeout = 200
-- let g:compe.incomplete_delay = 400
-- let g:compe.max_abbr_width = 100
-- let g:compe.max_kind_width = 100
-- let g:compe.max_menu_width = 100
-- let g:compe.documentation = v:true

