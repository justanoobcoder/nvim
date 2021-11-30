local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end
vim.api.nvim_set_keymap('n', '<Leader>pi', ':PackerInstall<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>pu', ':PackerUpdate<CR>', {})

local use = require('packer').use

return require('packer').startup(
function()
    -- Theme
    use 'folke/tokyonight.nvim'
    -- Status line
    use { 'glepnir/galaxyline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    -- For hex color
    use 'norcalli/nvim-colorizer.lua'
    -- File explorer
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
    -- For indent line
    use 'lukas-reineke/indent-blankline.nvim'
    -- Commenter
    use 'preservim/nerdcommenter'
    -- Float terminal
    use 'voldikss/vim-floaterm'
    -- Buffer line
    use { 'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- Make finding stuff easier
    use { 'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }
    }
    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    ---- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'
    ---- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    -- For snippets
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- For buffer completion
    use 'hrsh7th/cmp-buffer'
    -- For path completion
    use 'hrsh7th/cmp-path'
    -- Auto pairs '', "", [], {}, (), ``
    --use 'jiangmiao/auto-pairs'
    use 'windwp/nvim-autopairs'
    -- For nice highlighting
    use 'nvim-treesitter/nvim-treesitter'
    -- Provide git signs
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- Smooth scrolling
    use 'karb94/neoscroll.nvim'
end
)
