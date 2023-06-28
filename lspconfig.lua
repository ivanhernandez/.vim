local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'


local fluttertools = require 'flutter-tools'

local home = vim.fn.expand("$HOME")
local pid = vim.fn.getpid()

-- From `compe`:  local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LUA_LS --------------------------------------------------------------------------------------
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for lua-language-server")
end

local lua_ls_root_path = vim.fn.expand('$XDG_CONFIG_HOME') .. '/lua-ls/lua-language-server'
local lua_ls_binary = lua_ls_root_path.."/bin/"..system_name.."/lua-language-server.exe"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    cmd = {lua_ls_binary, "-E", lua_ls_root_path .. "/main.lua"};
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

-- local csharp_ls_root_path = home .. '/.dotnet/tools/.store/csharp-ls/0.8.0/csharp-ls/0.8.0/tools/net7.0/any'
-- local csharp_ls_binary = csharp_ls_root_path .. "/CSharpLanguageServer.dll"
-- lspconfig.csharp_ls.setup{
--     cmd = { "dotnet",  csharp_ls_binary }
-- }

lspconfig.cssls.setup {
    capabilities = capabilities,
    cmd = { "vscode-css-language-server.cmd", "--stdio" },
}

lspconfig.clangd.setup {
    capabilities = capabilities,
    cmd = { "clangd", "--background-index" },
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

local omnisharp_root_path = vim.fn.expand('$XDG_CONFIG_HOME') .. '\\omnisharp-roslyn-net6.0'
local omnisharp_binary = omnisharp_root_path .. "\\OmniSharp.dll"
lspconfig.omnisharp.setup{
    cmd = { "dotnet", omnisharp_binary },
    on_attach = function (client, bufnr)
        -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1492605642
        local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        for i, v in ipairs(tokenModifiers) do
          tmp = string.gsub(v, ' ', '_')
          tokenModifiers[i] = string.gsub(tmp, '-_', '')
        end
        local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        for i, v in ipairs(tokenTypes) do
          tmp = string.gsub(v, ' ', '_')
          tokenTypes[i] = string.gsub(tmp, '-_', '')
        end
        on_attach(client, bufnr)
    end,
    analyze_open_documents_only = false,
    enable_editorconfig_support = true,
    -- enable_import_completion = false,
    -- enable_ms_build_load_projects_on_demand = false,
    -- enable_roslyn_analyzers = false,
    -- organize_imports_on_format = false,
    -- sdk_include_prereleases = true,
    filetypes = { "cs", "cshtml", "fs", "csx", "fsx", "blazor"}
    --root_dir = [[root_pattern(".sln") or root_pattern(".csproj")]]
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
    cmd = { "zls.exe"}
}



-- nlualsp.setup(lspconfig, {
--   on_attach = function() end,

--   -- Include globals you want to tell the LSP are real :)
--   globals = {
--     -- Colorbuddy
--     "Color", "c", "Group", "g", "s",
--   }
-- })
