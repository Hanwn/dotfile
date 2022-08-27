local keymap = {
	-- insert mode map
	{ "i", "jj", "<ESC>", { noremap = true, silent = true } },

	-- normal mode map
	{ "n", "J", "5j", { noremap = true, silent = true } },
	{ "n", "K", "5k", { noremap = true, silent = true } },
	{ "n", ">", ">>", { noremap = true, silent = true } },
	{ "n", "<", "<<", { noremap = true, silent = true } },
	{ "n", "sv", ":set splitright<CR>:vsplit<CR>", { noremap = true, silent = true } },
	{ "n", "sh", ":set splitbelow<CR>:split<CR>", { noremap = true, silent = true } },
	{ "n", "<C-h>", "<C-w>h", { noremap = true, silent = true } },
	{ "n", "<C-k>", "<C-w>k", { noremap = true, silent = true } },
	{ "n", "<C-j>", "<C-w>j", { noremap = true, silent = true } },
	{ "n", "<C-l>", "<C-w>l", { noremap = true, silent = true } },

	{ "n", "<leader>q", ":q!<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>w", ":wq<CR>", { noremap = true, silent = true } },
	{ "n", "Y", "y$", { noremap = true, silent = true } },
	-- {'n', 'H', '0', {noremap = true, silent = true}},
	-- {'n', 'L', '$', {noremap = true, silent = true}},

	{ "n", "[t", ":-tabnext<CR>", { noremap = true, silent = true } },
	{ "n", "]t", ":+tabnext<CR>", { noremap = true, silent = true } },
	{ "n", "[b", ":bp<CR>", { noremap = true, silent = true } },
	{ "n", "]b", ":bn<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>n", ":tabe<CR>", { noremap = true, silent = true } },
	{ "n", "<leader><CR>", ":nohlsearch<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>1", ":tabn 1<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>2", ":tabn 2<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>3", ":tabn 3<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>4", ":tabn 4<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>5", ":tabn 5<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>6", ":tabn 6<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>7", ":tabn 7<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>8", ":tabn 8<CR>", { noremap = true, silent = true } },
	{ "n", "<leader>9", ":tabn 9<CR>", { noremap = true, silent = true } },
	-- visual mode map
	{ "v", "J", "5j", { noremap = true, silent = true } },
	{ "v", "K", "5k", { noremap = true, silent = true } },
}

local init_keymap = function()
	for _, value in ipairs(keymap) do
		vim.api.nvim_set_keymap(value[1], value[2], value[3], value[4])
	end
end

init_keymap()
