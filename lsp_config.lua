lspconfig = require'lspconfig'
nlualsp = require'nlua.lsp.nvim'
fluttertools = require'flutter-tools'

local pid = vim.fn.getpid()

lspconfig.bashls.setup{}
--lspconfig.denols.setup{}
--lspconfig.dockerls.setup{}
lspconfig.elmls.setup{}
fluttertools.setup{}
lspconfig.gopls.setup{}
lspconfig.jsonls.setup {
    cmd = { "vscode-json-languageserver.cmd", "--stdio" }
    -- commands = {
    --   Format = {
    --     function()
    --       vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
    --     end
    --   }
    -- }
}
nlualsp.setup(lspconfig, {
  on_attach = function() end,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})
lspconfig.nimls.setup{}
--local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
--lspconfig.omnisharp.setup{
--    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
--}
lspconfig.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}
--lspconfig.rust_analyzer.setup{}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}
lspconfig.vls.setup{
    cmd = { "vls.exe", "" }
}
lspconfig.yamlls.setup{
    cmd = { "yaml-language-server.cmd", "--stdio" }
}


