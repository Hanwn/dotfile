return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    use 'shaunsingh/nord.nvim'
    use 'ful1e5/onedark.nvim'
    use 'windwp/nvim-autopairs'
    use "numToStr/FTerm.nvim"

    use "lukas-reineke/indent-blankline.nvim"

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use({
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
    })

    use("williamboman/nvim-lsp-installer")
    use("neovim/nvim-lspconfig")

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }


    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }


    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
