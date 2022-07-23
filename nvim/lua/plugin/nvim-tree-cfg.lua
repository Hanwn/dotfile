require("nvim-tree").setup{
    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true }),
    view = {
        mappings = {
            list = {
                {key = 'l', action="edit"},
                {key = '?', action="toggle_help"},
                {key = 'h', action="close_node"},
                {key = 't', action="tabnew"},
                {key = '[g', action="prev_git_item"},
                {key = ']g', action="next_git_item"}
            }
        }
    }
}

