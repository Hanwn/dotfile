local command = {
	"syntax on",
	"set number",
	"set relativenumber",
	"let mapleader=' '",
	"set list",
	"set encoding=UTF-8",
	"set nocompatible",
	"set background=dark",
	"set wildmenu",
	"set wildignorecase",
	"set showcmd",
	"set cursorline",
	"set hlsearch",
	"set scrolloff=5",
	"set ignorecase",
	"set expandtab",
	"set fileformat=unix",
	"set showtabline=2",
	"set ts=4",
	"set shiftwidth=4",
	"set termguicolors",
}

local init_editor = function()
	for _, value in ipairs(command) do
		vim.api.nvim_command(value)
	end
end

init_editor()
