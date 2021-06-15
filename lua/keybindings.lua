local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- Disbale 'Space' key
map('n', '<Space>', '', opt)

-- copy everything
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- Set 'Space' key as leader key
G.mapleader = ' '

-- Replace something with something
map('n', '<Leader>s', ':%s//g<Left><Left>', { silent = false })

-- Disable arrow keys
map('', '<Up>', '', opt)
map('i', '<Up>', '', opt)
map('', '<Down>', '', opt)
map('i', '<Down>', '', opt)
map('', '<Left>', '', opt)
map('i', '<Left>', '', opt)
map('', '<Right>', '', opt)
map('i', '<Right>', '', opt)


map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', opt)
map('x', 'J', ':move \'>+1<CR>gv-gv', opt)

-- Move between windows
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-l>', '<C-w>l', opt)

-- Use Tab and Shift-Tab to move block of text in visual mode
map('v', '<TAB>', '>gv', opt)
map('v', '<S-TAB>', '<gv', opt)

-- Run make install clean
map('n', '<Leader>mk', ':w!<CR>:!sudo make install clean<CR>', opt)

--cmd([[
--inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
--inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
--]])
