return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    require("ufo").setup()
  end,
}
