require("telescope").setup{
  vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope<CR>', { noremap = true, silent = true }),
  defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key"
            }
        }
      },
  pickers = {
  },
  extensions = {
  }
}
require('telescope').load_extension("projects")
require('telescope').load_extension('neoclip')
