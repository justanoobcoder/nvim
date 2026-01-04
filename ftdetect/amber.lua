vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.ab", "*/amber/*" },
  callback = function()
    vim.bo.filetype = "amber"
  end,
})
