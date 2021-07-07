--CMD [[packadd nvim-lspconfig]]
--CMD [[packadd nvim-compe]]

function on_attach(client)
    local function map(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true, normal = true}
    map("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    map("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    map("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    map("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    map("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        map("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        map("<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

local lspconf = require "lspconfig"
local servers = {"html", "cssls", "pyright" , "bashls"}

G.completion_enable_snippet = 'snippets.nvim'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
for k, lang in pairs(servers) do
    lspconf[lang].setup {
        root_dir = vim.loop.cwd,
        capabilities = capabilities
    }
end

-- ccls lsp settings
lspconf.ccls.setup {
    cmd = {
        'ccls',
        '--init={"cache": {"directory": "/tmp/ccls-cache"}}'
    };
    capabilities = capabilities
}

-- lua lsp settings
USER = "/home/" .. vim.fn.expand("$USER")

local sumneko_root_path = USER .. "/.config/lua-language-server"
local sumneko_binary = USER .. "/.config/lua-language-server/bin/Linux/lua-language-server"

lspconf.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
                runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}


vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})
