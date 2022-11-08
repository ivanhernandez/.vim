local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

local fluttertools = require 'flutter-tools'

local home = vim.fn.expand("$HOME")
local pid = vim.fn.getpid()

-- From `compe`:  local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- SUMNEKO --------------------------------------------------------------------------------------
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.expand('$XDG_CONFIG_HOME') .. '/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server.exe"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
--- -----------------------------------------------



lspconfig.bashls.setup{
  capabilities = capabilities,
}

-- Download bicep server from https://github.com/Azure/bicep/
local bicep_root_path = vim.fn.expand('$XDG_CONFIG_HOME') .. '/bicep-langserver'
local bicep_binary = bicep_root_path .. "/Bicep.LangServer.exe"
configs.bicep = { 
  default_config = { 
    filetypes = { "bicep" } };
}
lspconfig.bicep.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern(".git"),
  cmd = { bicep_binary }
}

lspconfig.cssls.setup {
    capabilities = capabilities,
    cmd = { "vscode-css-language-server.cmd", "--stdio" }
}


lspconfig.denols.setup {
    capabilities = capabilites,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json"),
  init_options = {
    lint = true,
  },
}

--lspconfig.dockerls.setup{}

lspconfig.elmls.setup{
    capabilities = capabilities,
    cmd = { "elm-language-server.cmd" }
}

fluttertools.setup{
}

lspconfig.gopls.setup{
    capabilities = capabilities,
}

lspconfig.html.setup { 
    capabilities = capabilities,
    cmd = { "vscode-html-language-server.cmd", "--stdio" }
}

lspconfig.jsonls.setup {
    capabilities = capabilities,
    cmd = { "vscode-json-languageserver.cmd", "--stdio" }
    -- commands = {
    --   Format = {
    --     function()
    --       vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
    --     end
    --   }
    -- }
}

-- lspconfig.nimls.setup{}

local omnisharp_bin = vim.fn.expand('$PROOT')..'vi/omnisharp-vim/omnisharp-roslyn/OmniSharp.exe'
lspconfig.omnisharp.setup{
    capabilities = capabilities,
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}

lspconfig.rescriptls.setup {
    capabilities = capabilities,
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

lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
}

lspconfig.svelte.setup{
    capabilities = capabilities,
    cmd = { "svelteserver.cmd", "--stdio" }
}

lspconfig.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("package.json"),
    init_options = {
        lint = true
    }
}

lspconfig.vimls.setup{
    capabilities = capabilities,
}

lspconfig.vls.setup{
    capabilities = capabilities,
    cmd = { "vls.exe", "" }
}

lspconfig.yamlls.setup{
    capabilities = capabilities,
    cmd = { "yaml-language-server.cmd", "--stdio" }
}

lspconfig.zls.setup{
    capabilities = capabilities,
    cmd = { "zls.exe", "" }
}



-- nlualsp.setup(lspconfig, {
--   on_attach = function() end,

--   -- Include globals you want to tell the LSP are real :)
--   globals = {
--     -- Colorbuddy
--     "Color", "c", "Group", "g", "s",
--   }
-- })
