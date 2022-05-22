"""""""""""
"Set area
""""""""""""

let mapleader=" "
let autosave=5
set tags=tags;
set autochdir
set list
set number
syntax on
set encoding=UTF-8
set nocompatible
set background=dark
set t_Co=256
set wildmenu
set wildignorecase
set showcmd
set cursorline
set backspace=indent,eol,start
set shortmess-=S
set relativenumber
set hlsearch
set scrolloff=5
set ignorecase
set smartcase
set expandtab
set fileformat=unix
set showtabline=2
if (has("termguicolors"))
    set termguicolors
endif

set ts=4
set shiftwidth=4
set ma
set foldmethod=indent
set nofoldenable
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<ESC>]50;CursorShape=2\x7"
let &t_EI = "\<ESC>]50;CursorShape=0\x7"

""colorscheme setting
"colorscheme nord
"colorscheme gruvbox
colorscheme onedark
