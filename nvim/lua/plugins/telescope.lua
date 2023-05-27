-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope<CR>", { noremap = true, silent = true })
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
