return {
  'nvim-lualine/lualine.nvim',
  dependenies = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require("lualine").setup{}
  end
}
