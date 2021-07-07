local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

local use = require('packer').use

return require('packer').startup(
    function()
        use { 'wbthomason/packer.nvim', opt = true }
        -- Theme
        use 'folke/tokyonight.nvim'
        -- Status line
        use 'glepnir/galaxyline.nvim'
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
        use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }
        -- Make finding stuff easier
        use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} } }
        --use 'nvim-telescope/telescope-media-files.nvim'
        -- Neovim LSP
        use 'neovim/nvim-lspconfig'
        -- Tab/Auto completion
        use 'hrsh7th/nvim-compe'
        use 'jiangmiao/auto-pairs'
        -- For nice highlighting
        use 'nvim-treesitter/nvim-treesitter'
        --use 'kabouzeid/nvim-lspinstall'
        -- For snippets
        use 'hrsh7th/vim-vsnip'
        -- Auto pairs '', "", [], {}, (), ``
        use 'windwp/nvim-autopairs'
        --use 'alvan/vim-closetag'
        --use 'hrsh7th/vim-vsnip-integ'
        -- vscode-like pictograms for neovim lsp completion items
        use 'onsails/lspkind-nvim'
        -- Provide git signs
        use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
        -- Smooth scrolling
        use 'karb94/neoscroll.nvim'
        -- Show warnings, errors list
        use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    end
)
