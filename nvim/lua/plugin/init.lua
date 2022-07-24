require("plugin.lsp")
require("plugin.luasnip")

function Setup(tab)
    require(tab.name).setup(tab.settings)
end


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')


return packer.startup(function(use)
    local path = "plugin."
    use {'plugin'}
    use 'wbthomason/packer.nvim'

    -- THEMES
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    use 'shaunsingh/nord.nvim'
    use {
        'ful1e5/onedark.nvim',
        Setup(require(path .. 'onedark'))
    }

    -- TOOLS
    use {
        'windwp/nvim-autopairs',
        Setup(require(path .. "autopairs"))
    }
    use {
        "numToStr/FTerm.nvim",
        Setup(require(path .. "fterm"))
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        Setup(require(path .. "indent-blankline"))
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        Setup(require(path .. "telescope"))
    }
    use {
        'rcarriga/nvim-notify',
        Setup(require(path .. "notify"))
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
    use {
        'L3MON4D3/LuaSnip'
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    -- use('SirVer/ultisnips')
    -- use('quangnguyen30192/cmp-nvim-ultisnips')

    -- STYLE
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        Setup(require(path .. "bufferline"))
    }
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release
        Setup(require(path .. "gitgutter"))
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        Setup(require(path .. "treesitter"))
    }

    use {
        "ahmedkhalf/project.nvim",
        Setup(require(path .. "project"))
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        Setup(require(path .. "nvim-tree"))
    }

    use {
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        Setup(require(path .. "hop"))
    }

    use {
        'stevearc/aerial.nvim',
        Setup(require(path .. "aerial"))
    }

    if packer_bootstrap then
        require('packer').sync()
    end

end)

