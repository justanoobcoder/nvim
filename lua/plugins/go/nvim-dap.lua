return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "delve" })
      end,
    },
    {
      "leoluz/nvim-dap-go",
      config = true,
    },
  },
}
