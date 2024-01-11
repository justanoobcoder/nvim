return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if require("lazy.core.config").spec.plugins["noice"] ~= nil then
      opts.defaults["<leader>sn"] = { name = "+noice" }
    end
  end,
}
