return {
  "nvim-pack/nvim-spectre",
  -- stylua: ignore
  keys = {
    { "<leader>rf", function() require("spectre").toggle() end, desc = "Toggle Spectre" },
    { "<leader>rc", function() require("spectre").open_file_search({select_word=true}) end, desc = "Replace in current file (Spectre)" },
    { "<leader>rw", function() require("spectre").open_visual({select_word=true}) end, mode = "n", desc = "Search current word (Spectre)" },
    { "<leader>rw", function() require("spectre").open_visual() end, mode = "v", desc = "Search current word (Spectre)" },
  },
}
