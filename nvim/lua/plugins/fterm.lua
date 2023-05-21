return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
	vim.keymap.set("n", "<F12>", '<CMD>lua require("FTerm").toggle()<CR>'),
	vim.keymap.set("t", "<F12>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>'),
	border = "double",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
    })
  end
}
