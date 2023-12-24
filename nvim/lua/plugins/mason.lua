return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      vim.keymap.set("n", "<leader>mm", "<cmd>Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
    require("mason").setup({})
    end
}
