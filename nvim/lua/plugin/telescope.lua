local plugin = {}

plugin.name = 'telescope'
plugin.settings = {
    vim.api.nvim_set_keymap('', '<leader>f', ':Telescope<CR>', { noremap = true, silent = true }),
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
-- require('telescope').load_extension("projects")

return plugin
