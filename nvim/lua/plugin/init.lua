require("plugin.lsp")

function Setup(tab)
    require(tab.name).setup(tab.settings)
end

Setup(require("plugin.onedark-cfg"))
Setup(require("plugin.treesitter-cfg"))
Setup(require("plugin.nvim-tree-cfg"))
Setup(require("plugin.autopairs-cfg"))
Setup(require("plugin.bufferline-cfg"))
Setup(require("plugin.fterm-cfg"))
Setup(require("plugin.gitgutter-cfg"))
Setup(require("plugin.indent-blankline-cfg"))
Setup(require("plugin.telescope-cfg"))
Setup(require("plugin.lualine-cfg"))
Setup(require("plugin.project-cfg"))
-- setup(require("navigator-cfg"))
