return {

  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    vim.keymap.set('n', '<leader>fh', "<cmd>:TodoTelescope<cr>", { noremap = true, silent = true, desc = "find todo use telescope"})
    vim.keymap.set('n', '<leader>ft', "<cmd>:TodoTrouble<cr>", { noremap = true, silent = true, desc = "find todo use trouble"})
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
