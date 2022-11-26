local tree_status, nvimtree = pcall(require, "nvim-tree")
if not tree_status then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree
nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		mappings = {
			list = {
				{ key = "l", action = "edit" },
				{ key = "?", action = "toggle_help" },
				{ key = "h", action = "close_node" },
				{ key = "t", action = "tabnew" },
				{ key = "[g", action = "prev_git_item" },
				{ key = "]g", action = "next_git_item" },
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})
