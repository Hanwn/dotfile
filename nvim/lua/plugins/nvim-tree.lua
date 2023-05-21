vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup ({
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
  end,
}
