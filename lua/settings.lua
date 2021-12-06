vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showtabline = 2
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.mouse = 'a'
vim.opt.cmdheight = 2
vim.opt.scrolloff = 5
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.inccommand = 'split'

-- Fix ibus issue when in normal mode
vim.cmd [[
function! IBusOff()
  " Lưu engine hiện tại
  let g:ibus_prev_engine = system('ibus engine')
  " Chuyển sang engine tiếng Anh
  execute 'silent !ibus engine xkb:us::eng'
endfunction
function! IBusOn()
  let l:current_engine = system('ibus engine')
  " nếu engine được set trong normal mode thì
  " lúc vào insert mode dùng luôn engine đó
  if l:current_engine !~? 'xkb:us::eng'
    let g:ibus_prev_engine = l:current_engine
  endif
  " Khôi phục lại engine
  execute 'silent !' . 'ibus engine ' . g:ibus_prev_engine
endfunction
augroup IBusHandler
    autocmd CmdLineEnter [/?] call IBusOn()
    autocmd CmdLineLeave [/?] call IBusOff()
    autocmd InsertEnter * call IBusOn()
    autocmd InsertLeave * call IBusOff()
augroup END
call IBusOff()
]]
