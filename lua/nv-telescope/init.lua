require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = '> ',
        selection_caret = '> ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
            mirror = false,
            },
            vertical = {
            mirror = false,
            },
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = { "smart" },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

local M = {}

function M.find_nvim()
    require('telescope.builtin').git_files({
        prompt_title = '< Neovim >',
        cwd = '~/.config/nvim',
    })
end

local opts = { silent = true }
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>", opts)
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>", opts)
map('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<cr>", opts)
map('n', '<leader>fe', ":lua require('telescope.builtin').diagnostics()<cr>", opts)
map('n', '<leader>fd', ":lua require('telescope.builtin').lsp_definitions()<cr>", opts)
map('n', '<leader>gs', ":lua require('telescope.builtin').git_status()<cr>", opts)
map('n', '<leader>gm', ":lua require('telescope.builtin').git_commits()<cr>", opts)
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>", opts)
map('n', '<leader>fv', ":lua require('nv-telescope').find_nvim()<cr>", opts)

return M
