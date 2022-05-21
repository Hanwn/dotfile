return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    use 'shaunsingh/nord.nvim'
    use 'ful1e5/onedark.nvim'

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

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release
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
        commit='80cdb00b221f69348afc4fb4b701f51eb8dd3120',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
