require("plugin.lsp")
require("plugin.plugins")
require("plugin.luasnip")

function Setup(tab)
    require(tab.name).setup(tab.settings)
end

local plugings = {
    "onedark",
    "treesitter",
    "nvim-tree",
    "autopairs",
    "bufferline",
    "fterm",
    "gitgutter",
    "indent-blankline",
    "telescope",
    "lualine",
    "project",
    "notify",
    "hop"
}

for _, v in pairs(plugings) do
    Setup(require("plugin." .. v))
end

