local plugin = {}

plugin.name = "FTerm"

plugin.settings = {
    vim.keymap.set('n', '<F12>', '<CMD>lua require("FTerm").toggle()<CR>'),
    vim.keymap.set('t', '<F12>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>'),
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
}

return plugin
