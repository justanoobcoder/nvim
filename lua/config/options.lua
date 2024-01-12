vim.g.mapleader = " "

vim.g.autoformat = true

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.laststatus = 3
opt.list = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.wildmode = "longest:full,full"
opt.wrap = false

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

vim.g.markdown_recommended_style = 0
