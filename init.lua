require "options"

local github = function(x) return 'https://github.com/' .. x end

vim.pack.add({
     { src = github('nvim-lua/plenary.nvim') }
    ,{ src = github('nvim-lua/popup.nvim') }
})

-- BOOTSTRAP LAZY.NVIM
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
-- 
-- require("lazy").setup("plugins")

require "plugins/colorschemes"
require "plugins/git"
require "plugins/lsp"
require "plugins/mini"
require "plugins/nvim-tree"
require "plugins/telescope"
require "plugins/utilities"

require "commands"


-- lspconfig -------------------------------------------------------

local home = vim.fn.expand("$HOME")
local pid = vim.fn.getpid()

local capabilities = vim.lsp.protocol.make_client_capabilities()
--[[ 
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true    -- from compe
--capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true      -- from markdown_oxide
--]]

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

vim.lsp.config("lua_ls", {
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
})

--- -----------------------------------------------


vim.lsp.config("bashls", {
    capabilities = capabilities,
})
vim.lsp.enable("bashls")

-- Download bicep server from https://github.com/Azure/bicep/
local bicep_root_path = vim.fn.expand('$XDG_CONFIG_HOME') .. '/bicep-langserver'
local bicep_binary = bicep_root_path .. "/Bicep.LangServer.exe"

-- require 'lspconfig/configs'.bicep = { 
--     default_config = { 
--         filetypes = { "bicep" } };
-- }
-- lspconfig.bicep.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
--     root_dir = lspconfig.util.root_pattern(".git"),
--     cmd = { bicep_binary }
-- }

-- local csharp_ls_root_path = home .. '/.dotnet/tools/.store/csharp-ls/0.8.0/csharp-ls/0.8.0/tools/net7.0/any'
-- local csharp_ls_binary = csharp_ls_root_path .. "/CSharpLanguageServer.dll"
-- lspconfig.csharp_ls.setup{
--     cmd = { "dotnet",  csharp_ls_binary }
-- }

vim.lsp.config("cssls", {
    capabilities = capabilities,
    cmd = { "vscode-css-language-server.cmd", "--stdio" },
})
vim.lsp.enable("cssls")

vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd", "--background-index" },
})
vim.lsp.enable("clangd")

vim.lsp.config("denols", {
    capabilities = capabilites,
    on_attach = on_attach,
    root_dir = require('lspconfig').util.root_pattern("deno.json"),
    init_options = {
        lint = true,
    },
})
vim.lsp.enable("denols")

--vim.lsp.enable("dockerls")

vim.lsp.config("gopls", {
    capabilities = capabilities,
})
vim.lsp.enable("gopls")

vim.lsp.config("html", { 
    capabilities = capabilities,
    cmd = { "vscode-html-language-server.cmd", "--stdio" }
})
vim .lsp.enable("html")

vim.lsp.config("jsonls", {
    capabilities = capabilities,
    cmd = { "vscode-json-languageserver.cmd", "--stdio" }
    -- commands = {
    --   Format = {
    --     function()
    --       vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
    --     end
    --   }
    -- }
})
vim.lsp.enable("jsonls")

vim.lsp.config("markdown_oxide", {
    capabilities = capabilities,
    cmd = { 'markdown-oxide' },
    filetypes = { 'markdown' },
    root_markers = { '.git', '.obsidian', '.moxide.toml' },
})
vim.lsp.enable("markdown_oxide")


local omnisharp_root_path = vim.fn.expand('$XDG_CONFIG_HOME') .. '\\omnisharp-roslyn-net6.0'
local omnisharp_binary = omnisharp_root_path .. "\\OmniSharp.dll"
vim.lsp.config("omnisharp", {
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
})
vim.lsp.enable("omnisharp")

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("svelte", {
    capabilities = capabilities,
    cmd = { "svelteserver.cmd", "--stdio" }
})
vim.lsp.enable("svelte")

vim.lsp.config("tsserver", {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = require('lspconfig').util.root_pattern("package.json"),
    init_options = {
        lint = true
    }
})
vim.lsp.enable("tsserver")

vim.lsp.config("vimls", {
    capabilities = capabilities,
})
vim.lsp.enable("vimls")

vim.lsp.config("yamlls", {
    capabilities = capabilities,
    cmd = { "yaml-language-server.cmd", "--stdio" }
})
vim.lsp.enable("yamlls")

vim.lsp.config("zls", {
    capabilities = capabilities,
    cmd = { "zls.exe" }
})
vim.lsp.enable("zls")

---------------------------------------------------------------------

require("keybindings")

switchDarkLightThemes()
