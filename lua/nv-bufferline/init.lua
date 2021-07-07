vim.opt.termguicolors = true

require('bufferline').setup {
    options = {
        mappings = false,
        right_mouse_command = 'vert sbuffer %d',
        show_close_icon = false,
        separator_style = os.getenv 'KITTY_WINDOW_ID' and 'slant' or 'padded_slant',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = diagnostics_indicator,
        custom_filter = custom_filter,
        offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          highlight = 'PanelHeading',
          padding = 1,
        },
        {
          filetype = 'DiffviewFiles',
          text = 'Diff View',
          highlight = 'PanelHeading',
          padding = 1,
        },
        { filetype = 'flutterToolsOutline' },
        },
    }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap

-- Add new buffer and move to it
map('n', '<Leader>t', ':tabnew<CR>', opt)
-- Buffer pick functionality
map('n', '<Leader>b', ':BufferLinePick<CR>', opt)
-- Remove a buffer
map('n', '<Leader>q', ':bd<CR>', opt)
-- Switch among buffers
map('n', '<TAB>', ':bnext<CR>', opt)
map('n', '<S-TAB>', ':bprevious<CR>', opt)
