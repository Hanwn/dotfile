""""""""""""
"Set area
""""""""""""
let mapleader=" "
set number
set ts=4
set shiftwidth=4
syntax on
set encoding=utf-8
set nocompatible
set background=dark
set cursorline
set backspace=indent,eol,start
set relativenumber
set hlsearch
set showcmd
set wildmenu
set scrolloff=5
""""""""""""""
"Key Mapping
""""""""""""""
map S :w<CR>
map s <nop>
map Q :q<CR>
noremap <C-n> :vne<CR>
noremap J 5j
noremap K 5k
noremap <up> :res +5<CR>
noremap tt :NERDTreeToggle<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <leader><CR> :nohlsearch<CR>
noremap <right> :vertical resize+5<CR>
inoremap jj <esc>
""""""""""""""
"Quickly Run
""""""""""""

map<F5> : call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'python'
		exec "!time python %"
	endif
endfunc

autocmd vimenter * NERDTree

""""""""""""""
"Plug install postion
""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'severin-lemaignan/vim-minimap'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["mysnips"]
call plug#end()

