
-- insert mode map
vim.api.nvim_set_keymap('i', 'jj', "<ESC>", { noremap=true, silent=true})
-- vim.api.nvim_set_keymap('i', '', "", {noremap=true, silent=true})


-- normal mode map

vim.api.nvim_set_keymap('n', 'J', '5j', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'K', '5k', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '>', '>>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<', '<<', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>x', ':q<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>q', ':q!<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>w', ':wq<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', 'sv', ':set splitright<CR>:vsplit<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'sh', ':set splitbelow<CR>:split<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', 'H', '0', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'L', '$', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'leader<CR>', ':nohlsearch<CR>', {noremap=true, silent=true})

-- buffer setting
vim.api.nvim_set_keymap('n', '[b', ':bp<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ']b', ':bn<CR>', {noremap=true, silent=true})

-- tab setting
vim.api.nvim_set_keymap('n', '[t', ':-tabnext<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ']t', ':+tabnext<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>1 :', ':tabn 1', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>2 :', ':tabn 2', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>3 :', ':tabn 3', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>4 :', ':tabn 4', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>5 :', ':tabn 5', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>6 :', ':tabn 6', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>7 :', ':tabn 7', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>8 :', ':tabn 8', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>9 :', ':tabn 9', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>10 :', ':tabn 10', {noremap=true, silent=true})

-- visual mode map

vim.api.nvim_set_keymap('v', 'J', '5j', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', 'K', '5k', {noremap=true, silent=true})

return {}