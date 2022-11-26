local lualine_status, lualine = pcall(require, "lualine")

if not lualine_status then
    return
end

lualine.setup({
	options = {
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
})
