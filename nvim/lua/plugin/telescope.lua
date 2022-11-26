local telescope_status, telescope = pcall(require, "telescope")

if not telescope_status then
	return
end

telescope.setup({
	vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope<CR>", { noremap = true, silent = true }),
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {},
	extensions = {},
})

telescope.load_extension("projects")
