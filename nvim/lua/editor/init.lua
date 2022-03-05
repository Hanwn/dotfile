
local init_editor = function()
    local command = require("editor.attribute")
    for _, value in ipairs(command) do
        vim.api.nvim_command(value)
    end
end

local init_keymap = function ()
    local keymap = require("editor.keymap")
    for _, value in ipairs(keymap) do
        vim.api.nvim_set_keymap(value)
    end
end


init_editor()
init_keymap()