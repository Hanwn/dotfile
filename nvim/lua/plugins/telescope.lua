-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	require("telescope").setup({
	vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope<CR>", { noremap = true, silent = true }),
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
