return {
  "nvim-tree/nvim-tree.lua",
  -- version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opt = function()
    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      }
    }
  end,
  config = function()
    vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", { silent=true, noremap=true, desc="Open Nvim-Tree"})
    require("nvim-tree").setup {}
  end,
  extensions = { "neo-tree", "lazy" },
}
