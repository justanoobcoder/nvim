return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
}
