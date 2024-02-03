return {
  "NvChad/nvim-colorizer.lua",
  opts = {
    filetypes = {
      "*",
      css = {
        names = true,
        tailwind = true,
        css = true,
        RRGGBBAA = true,
        AARRGGBB = true,
      },
      html = {
        names = true,
        tailwind = true,
      },
      javascript = {
        names = true,
        tailwind = true,
      },
      javascriptreact = {
        names = true,
        tailwind = true,
      },
    },
    user_default_options = {
      mode = "background",
      names = false,
    },
  },
}
