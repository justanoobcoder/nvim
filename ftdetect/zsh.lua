vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*/zsh/*" },
  callback = function()
    vim.bo.filetype = "zsh"
  end,
})
