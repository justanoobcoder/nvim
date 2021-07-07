local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

local use = require("packer").use

-- using { } when using a different branch of the plugin or loading the plugin with certain commands
return require("packer").startup(
    function()
        use { "wbthomason/packer.nvim", opt = true }
        use "lukas-reineke/indent-blankline.nvim"
		use "folke/tokyonight.nvim"
        use "norcalli/nvim-colorizer.lua"
        use "nvim-treesitter/nvim-treesitter"
        use "neovim/nvim-lspconfig"
		use "kabouzeid/nvim-lspinstall"
        use "hrsh7th/nvim-compe"
        use "hrsh7th/vim-vsnip"
        --use "hrsh7th/vim-vsnip-integ"
        use "onsails/lspkind-nvim"
        use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use "voldikss/vim-floaterm"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
        use { "nvim-telescope/telescope.nvim", requires = { {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"} } }
        use "nvim-telescope/telescope-media-files.nvim"
        use "karb94/neoscroll.nvim"
        use "preservim/nerdcommenter"
        use { "folke/lsp-trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
    end
)
