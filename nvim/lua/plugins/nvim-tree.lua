return {
  "nvim-tree/nvim-tree.lua",
  -- version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeFindFileToggle<cr>", { silent=true, noremap=true, desc="Open Nvim-Tree"})
    require("nvim-tree").setup {}
  end,
  extensions = { "neo-tree", "lazy" },
}
