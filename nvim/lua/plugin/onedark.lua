local ontedark_status, onedark = pcall(require, "onedark")
if not ontedark_status then
	return
end

onedark.setup({
	style = "darker",
	toggle_style_key = "<NOP>",
})
