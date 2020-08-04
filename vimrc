"""""""""""
"Set area
""""""""""""
let mapleader=" "
let autosave=5
set tags=tags;
set autochdir
set number
set ts=4
set shiftwidth=4
syntax on
set encoding=UTF-8
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
nnoremap tag :TagbarToggle<CR>
nnoremap mm :MinimapToggle<CR>
nnoremap <down> :res -5<CR>
nnoremap <up> :res +5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <leader><CR> :nohlsearch<CR>
nnoremap <right> :vertical resize+5<CR>
nnoremap zsh :bel term ++rows=10<CR>
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
	elseif &filetype == 'javascript'
		exec "!time node %"
	endif
endfunc

" call NERDTree
autocmd vimenter * :call VimEnterFunc()
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())| q |endif
func! VimEnterFunc()
	exec ":NERDTree"
	exec "normal \<C-w>\<C-w>"
	exec ":Tagbar"
endfunc



"pyfile title
autocmd BufNewFile *.py :call SetTitle()
autocmd BufWritePost * NERDTreeFocus | exec 'normal R' | wincmd p

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
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ycm-core/YouCompleteMe'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


let g:TreeOnOpen=1
let g:NERDTreeWinSize=20
let g:tagbar_width=25


let g:quickrun_no_default_key_mappings = 1

"""""
"test area
""""""
nnoremap ;; :call MU()<CR>
func! MU()
	if &filetype == "python"
		exec "normal! mqA:\<ESC>`q"
	else
		exec "normal! mqA;\<esc>`q"
	endif
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


fun! BufWinEnterAutoCmd()
    if g:TreeOnOpen
        if exists('g:NERDTree')
            if ! g:NERDTree.IsOpen()
                NERDTreeMirror
                wincmd p    " 移动到前一个 (previous) (上次访问的) 窗口
            endif
        else
            NERDTreeMirror
            wincmd p    " 移动到前一个 (previous) (上次访问的) 窗口
        endif
    endif
endf
autocmd BufWinEnter * call BufWinEnterAutoCmd()

