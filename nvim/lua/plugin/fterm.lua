local fterm_status, fterm = pcall(require, "FTerm")
if not fterm_status then
	return
end

fterm.setup({
	vim.keymap.set("n", "<F12>", '<CMD>lua require("FTerm").toggle()<CR>'),
	vim.keymap.set("t", "<F12>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>'),
	border = "double",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})
