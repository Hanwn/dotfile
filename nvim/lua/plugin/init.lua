require("plugin.lsp")

function Setup(tab)
    require(tab.name).setup(tab.settings)
end

local plugings = {
    "onedark-cfg",
    "treesitter-cfg",
    "nvim-tree-cfg",
    "autopairs-cfg",
    "bufferline-cfg",
    "fterm-cfg",
    "gitgutter-cfg",
    "indent-blankline-cfg",
    "telescope-cfg",
    "lualine-cfg",
    "project-cfg",
    "notify-cfg"
}

for _, v in pairs(plugings) do
    Setup(require("plugin." .. v))
end

