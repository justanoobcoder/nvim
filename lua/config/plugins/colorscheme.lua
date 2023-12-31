return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- There are 3 styles: day, night and storm
    --vim.g.tokyonight_style = 'night'
    --vim.g.tokyonight_italic_comments = true
    --vim.g.tokyonight_italic_keywords = false
    --vim.g.tokyonight_italic_functions = true
    --vim.g.tokyonight_italic_variables = false
    --vim.g.tokyonight_transparent = false
    --vim.g.tokyonight_hide_inactive_statusline = false
    --vim.g.tokyonight_dark_sidebar = true
    --vim.g.tokyonight_dark_float = true
    vim.cmd 'colorscheme tokyonight'
  end,
}
