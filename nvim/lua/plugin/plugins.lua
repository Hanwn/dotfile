local packer = require('packer')

return packer.startup(function(use)
    use {'plugin'}
    use 'wbthomason/packer.nvim'

    -- THEMES
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    use 'shaunsingh/nord.nvim'
    use 'ful1e5/onedark.nvim'

    -- TOOLS
    use 'windwp/nvim-autopairs'
    use "numToStr/FTerm.nvim"

    use "lukas-reineke/indent-blankline.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'rcarriga/nvim-notify'
    }

    -- LSP conig
    --
    use("williamboman/nvim-lsp-installer")
    use("neovim/nvim-lspconfig")
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')
    use('SirVer/ultisnips')
    use('quangnguyen30192/cmp-nvim-ultisnips')

    -- STYLE
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        "ahmedkhalf/project.nvim",
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

end)
