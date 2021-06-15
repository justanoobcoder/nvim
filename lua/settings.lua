O.hidden = true
CMD "set termguicolors"
WO.conceallevel = 0
O.hlsearch = false
O.mouse = "a"
CMD "set tabstop=4"
CMD "set shiftwidth=4"
O.smarttab = true
BO.autoindent = true
BO.expandtab = true
BO.smartindent = true
O.cmdheight = 2
WO.lbr = true
WO.number = true
WO.relativenumber = true
O.clipboard = "unnamedplus"
O.updatetime = 300
O.timeoutlen = 500
O.background = "dark"
O.showtabline = 2
O.scrolloff = 5
O.backup = false
O.writebackup = false
WO.signcolumn = "yes"
O.incsearch = true
O.guifont = "JetBrainsMono\\ Nerd\\ Font"
G.indentLine_enabled = 1
G.indent_blankline_char = "▏"
CMD "hi IndentBlanklineChar guifg=#2a2e36"
G.indent_blankline_filetype_exclude = {"help", "terminal"}
G.indent_blankline_buftype_exclude = {"terminal"}
G.indent_blankline_show_trailing_blankline_indent = false
G.indent_blankline_show_first_indent_level = false
-- highlights --
CMD "hi LineNr guifg=#42464e guibg=NONE"
CMD "hi Comment guifg=#42464e"
CMD "hi SignColumn guibg=NONE"
CMD "hi VertSplit guibg=NONE guifg=#2a2e36"
CMD "hi EndOfBuffer guifg=#1e222a"
CMD "hi PmenuSel guibg=#98c379"
CMD "hi Pmenu  guibg=#282c34"
CMD "hi Normal guibg=NONE ctermbg=NONE"
-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)

-- inactive statuslines as thin splitlines
CMD "highlight! StatusLineNC gui=underline guibg=NONE guifg=#383c44"

CMD "hi clear CursorLine"
CMD "hi cursorlinenr guibg=NONE guifg=#abb2bf"
