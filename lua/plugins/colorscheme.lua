return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[
      if has('termguicolors')
        set termguicolors
      endif
      set background=dark

      let g:gruvbox_material_background = 'dark'
      let g:gruvbox_material_enable_bold = 1
      let g:gruvbox_material_enable_italic = 1
      let g:gruvbox_material_diagnostic_text_highlight = 1
      let g:gruvbox_material_diagnostic_line_highlight = 1
      let g:gruvbox_material_diagnostic_virtual_text = 'colored'
      let g:gruvbox_material_better_performance = 1

      colorscheme gruvbox-material
    ]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
