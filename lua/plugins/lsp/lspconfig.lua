return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- must load mason and mason-lspconfig first
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "windwp/nvim-ts-autotag",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- diagnostics
    for name, icon in pairs(require("util").icons.diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Goto declaration"
      map("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Goto definition"
      map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, opts) -- show lsp definitions

      opts.desc = "Goto implementation"
      map("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, opts) -- show lsp implementations

      opts.desc = "Goto type definition"
      map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show documentation for what is under cursor"
      map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      map("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      opts.desc = "Source Action"
      map(
        "n",
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        opts
      )
    end

    require("mason-lspconfig").setup_handlers {
      function (server_name)
        require("lspconfig")[server_name].setup({ on_attach = on_attach })
      end,
      ["lua_ls"] = function ()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            }
          }
        }
      end
    }
  end,
}
