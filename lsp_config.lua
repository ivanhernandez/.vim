lspconfig = require'lspconfig'
nlualsp = require'nlua.lsp.nvim'
fluttertools = require'flutter-tools'

local home = vim.fn.expand("$HOME")
local pid = vim.fn.getpid()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


lspconfig.bashls.setup{}
lspconfig.cssls.setup { 
    capabilities = capabilities,
    cmd = { "vscode-css-language-server.cmd", "--stdio" }
}
--lspconfig.denols.setup{}
--lspconfig.dockerls.setup{}
lspconfig.elmls.setup{
    cmd = { "elm-language-server.cmd" }
}
fluttertools.setup{}
lspconfig.gopls.setup{}
lspconfig.html.setup { 
    capabilities = capabilities,
    cmd = { "vscode-html-language-server.cmd", "--stdio" }
}
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
lspconfig.rescriptls.setup {
    cmd = { "node", home .. "/.vim/plugged/vim-rescript/server/out/server.js", "--stdio" },
    -- on_attach = function(client, bufnr)
    --     require "lsp_signature".on_attach()
    -- end,
}
-- lspconfig.rls.setup {
--   settings = {
--     rust = {
--       unstable_features = true,
--       build_on_save = false,
--       all_features = true,
--     },
--   },
-- }
lspconfig.rust_analyzer.setup{}
lspconfig.svelte.setup{
    cmd = { "svelteserver.cmd", "--stdio" }
}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}
lspconfig.vls.setup{
    cmd = { "vls.exe", "" }
}
lspconfig.yamlls.setup{
    cmd = { "yaml-language-server.cmd", "--stdio" }
}
lspconfig.zls.setup{
    cmd = { "zls.exe", "" }
}


