-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true, desc = "find files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true, desc = "live grep"})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true, desc = "find in buffers" })
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
      },
    })
  end
}
