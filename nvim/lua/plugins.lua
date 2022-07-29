local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')

return packer.startup(function(use)

    use 'wbthomason/packer.nvim'

    -- THEMES
    use {
        'navarasu/onedark.nvim',
        config = function()
            require("setup/onedark")
        end
    }

    -- -- TOOLS
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require("setup/telescope")
        end
    }

    use {
        'rcarriga/nvim-notify',
        config = function()
            require("setup/notify")
        end
    }

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("setup/project")
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        config = function()
            require("setup/nvim-tree")
        end
    }

    use {
         'windwp/nvim-autopairs',
         config = function() 
             require("setup/autopairs")
         end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('setup/comment')
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release', -- To use the latest release
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("setup/gitsigns")
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("setup/lualine")
        end
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() 
            require("setup/bufferline")
        end
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            require("setup/hop")
        end
    }

    use {
         'simrat39/symbols-outline.nvim',
         config = function()
             require("setup/outline")
         end
    }

    use {
        "numToStr/FTerm.nvim",
        config = function()
            require('setup/fterm')
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("setup/indent-blankline")
        end
    }

    use {
        'glepnir/dashboard-nvim',
        config = function()
            require("setup/dashboard")
        end
    }

    -- -- LSP conig
    -- --
    use {
        "neovim/nvim-lspconfig",
        requires = {{"williamboman/nvim-lsp-installer"}},
        config = function()
            require("setup/lsp")
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
        },
        config = function()
            require("setup/cmp")
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        requires = {
            {"rafamadriz/friendly-snippets"},
            {'saadparwaiz1/cmp_luasnip'}
        },
        config = function()
            require("setup/luasnip")
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("setup/treesitter")
        end
    }

    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
          -- you'll need at least one of these
          -- {'nvim-telescope/telescope.nvim'},
          -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            -- Setup(path .. "neoclip")
            require("setup/neoclip")
        end,
        require('telescope').load_extension('neoclip')
    }

    -- Lua
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("setup/todo")
        end
    }

    use {
        "kylechui/nvim-surround",
        config = function()
            require("setup/surround")
        end
    }

    -- use {
    --     'ray-x/navigator.lua',
    --     requires = {
    --         { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    --         { 'neovim/nvim-lspconfig' },
    --     },
    -- }



    if packer_bootstrap then
        require('packer').sync()
    end

end)

