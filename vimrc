"""""""""""
"Set area
""""""""""""
let mapleader=" "
set clipboard=uname
set number
set ts=4
set shiftwidth=4
syntax on
set encoding=utf-8
set nocompatible
set background=dark
set wildmenu
set showcmd
set cursorline
set backspace=indent,eol,start
set relativenumber
set hlsearch
set scrolloff=5
set smartcase


let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<ESC>]50;CursorShape=2\x7"
let &t_EI = "\<ESC>]50;CursorShape=0\x7"


""""""""""""""
"Key Mapping
""""""""""""""
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :NERDTreeRefreshRoot<CR>
nnoremap sv :set splitright<CR>:vsplit<CR>
nnoremap sh :set splitbelow<CR>:split<CR> 

nnoremap < <<
nnoremap > >>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


nnoremap <C-n> :vne<CR>
nnoremap J 5j
nnoremap K 5k
nnoremap tt :NERDTreeToggle<CR>
nnoremap mm :MinimapToggle<CR>
nnoremap <down> :res -5<CR>
nnoremap <up> :res +5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <leader><CR> :nohlsearch<CR>
nnoremap <right> :vertical resize+5<CR>

nnoremap <tab>n :tabe<CR>
nnoremap <tab>h :-tabnext<CR>
nnoremap <tab>l :+tabnext<CR>
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
		exec "!g++ % -std=c++11 -o %<"
		exec "!time ./%<"
	elseif &filetype == 'python'
		exec "!time python %"
	endif
endfunc

" call NERDTree
autocmd vimenter * :call VimEnterFunc()
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())| q |endif
func! VimEnterFunc()
	exec ":NERDTree"
	exec "normal \<C-w>\<C-w>"
endfunc



"pyfile title
autocmd BufNewFile *.py :call SetTitle()

func! SetTitle()
	call setline(1,"'''")
	call append(line(".")," - Author : hanwn")
	call append(line(".") + 1," - Date : ".strftime("%m-%d-%Y"))
	call append(line(".") + 2," - FileName : ".expand("%:t"))
	call append(line(".") + 3," - Email : hanwn7721@gmail.com")
	call append(line(".") + 4,"'''")
	exec "normal G"
endfunc


"""""""""""""""
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



"""""
"test area
""""""
nnoremap ;; :call MU()<CR>
func! MU()
	exec "normal! mqA;\<esc>`q"
endfunc



imap <C-_> <ESC>:call Comment()<CR>
nmap <C-_> :call Comment()<CR>

func! Comment()
	if &filetype == 'python'
		exec "normal! mqI#\<ESC>'q"
		exec "normal! i"
	else
		exec "normal! mqI//\<ESC>`q"
		exec "normal! i"
	endif
endfunc
