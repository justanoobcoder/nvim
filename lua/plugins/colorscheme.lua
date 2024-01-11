return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    local cmd = vim.cmd

    cmd([[set background=dark]])
    cmd([[let g:gruvbox_material_background = 'medium']])
    cmd([[let g:gruvbox_material_enable_bold = 1]])
    cmd([[let g:gruvbox_material_enable_italic = 1]])
    cmd([[let g:gruvbox_material_better_performance = 1]])
    cmd([[let g:gruvbox_material_dim_inactive_windows = 1]])
    cmd([[colorscheme gruvbox-material]])
  end,
}
