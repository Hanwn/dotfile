require("plugin.nvim-tree-cfg")
require("plugin.onedark-cfg")
require("plugin.telescope-cfg")
require("plugin.lualine-cfg")
require("plugin.navigator-cfg")
require("plugin.gitgutter-cfg")

require("nvim-tree").setup{
    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
}



