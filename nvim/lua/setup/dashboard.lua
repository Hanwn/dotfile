local dash = require("dashboard")

dash.preview_file_height = 12
dash.preview_file_width = 80

dash.custom_center = {
	{
		icon = "  ",
		desc = "New file                         ",
		shortcut = "~",
		action = "enew",
	},
	{
		icon = "  ",
		desc = "finder                           ",
		shortcut = "~",
		action = "Telescope find_files find_command=rg,--hidden,--files",
	},
	{
		icon = "  ",
		desc = "dots                             ",
		shortcut = "~",
		action = "Telescope find_files cwd=~/.config",
	},
	{
		icon = "  ",
		desc = "exit                             ",
		shortcut = "~",
		action = "qa",
	},
}

local function repeat_str(str, times)
	return times > 0 and str .. repeat_str(str, times - 1) or ""
end

local function make_custom_footer()
	local default_footer = { "", "Have fun with neovim" }
	if packer_plugins ~= nil then
		local count = #vim.tbl_keys(packer_plugins)
		default_footer[2] = "loaded " .. count .. " plugins"
	end
	return default_footer
end

dash.custom_footer = make_custom_footer

dash.custom_header = {
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[   ▄████▄              ▒▒▒▒▒   ]],
	[[  ███▄█▀              ▒ ▄▒ ▄▒  ]],
	[[ ▐████     █  █  █   ▒▒▒▒▒▒▒▒▒ ]],
	[[  █████▄             ▒▒▒▒▒▒▒▒▒ ]],
	[[   ▀████▀            ▒ ▒ ▒ ▒ ▒ ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
}
