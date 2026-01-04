if vim.b.did_ftplugin then
  return
end

vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

vim.bo.smartindent = true

vim.bo.formatoptions = vim.bo.formatoptions .. "ro"
vim.bo.comments = ":///,://"

vim.b.did_ftplugin = "amber"
vim.opt.colorcolumn = "80"
