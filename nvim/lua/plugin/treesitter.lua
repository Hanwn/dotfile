local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"c",
		"cpp",
		"go",
		"python",
		"rust",
		"cmake",
	},
})
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99
