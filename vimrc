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
map <C-a> ggVG
map R :NERDTreeRefreshRoot<CR>
nnoremap sv :set splitright<CR>:vsplit<CR>
nnoremap sh :set splitbelow<CR>:split<CR> 

nnoremap < <<
nnoremap > >>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


nnoremap <C-n> :set splitright<CR>:vne<CR>
nnoremap J 5j
nnoremap K 5k
nnoremap tt :NERDTreeToggle<CR>
nnoremap tag :TagbarToggle<CR>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <C-w><down> :res -5<CR>
nnoremap <C-w><up> :res +5<CR>
nnoremap <C-w><left> :vertical resize-5<CR>
nnoremap <C-w><right> :vertical resize+5<CR>
nnoremap <leader><CR> :nohlsearch<CR>
nnoremap zsh :bel term ++rows=10<CR>
nnoremap <tab>n :tabe<CR>
nnoremap <tab>h :-tabnext<CR>
nnoremap <tab>l :+tabnext<CR>
inoremap jj <esc>

"""""
"hight current line number
"""""
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermbg=yellow
highlight CursorLineNr ctermfg=Darkred
highlight CursorLineNr cterm=bold


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
	"exec ":Tagbar"
endfunc

""colorscheme
colorscheme gruvbox

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
Plug 'SirVer/ultisnips'
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'neoclide/coc.nvim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'itchyny/vim-cursorword'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'dense-analysis/ale'
call plug#end()

"""""
"Snippets setting
""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"""""
"NERDTree setting
""""""
let g:TreeOnOpen=1
let g:NERDTreeWinSize=20


"""""
"ale setting
""""""
let g:ale_sign_column=1
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚡'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = "✗"
let g:airline#extensions#ale#warning_symbol = "⚡"
let airline#extensions#coc#error_symbol="✗"
let airline#extensions#coc#warning_symbol="⚡"


let g:ale_lint_delay = 500
let g:ale_linter={
\	'c':['clang'],
\	'cpp':['clang'],
\	'javascript':['JSlint'],
\	'python':['pylint'],
\   'java':['javac']
\}



"""""
"airline setting
""""""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter="jsformatter"
let g:airline#extensions#tabline#show_tab_count=2
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#exclude_preview=1

"""""
"tagbar setting
"""""""""
let g:tagbar_width=25


let g:quickrun_no_default_key_mappings = 1



"""""
"test area
""""""



"add a : or ; at the end line of code.
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


"Used to comment code ,existing bug!
func! Comment()
	if &filetype == 'python'
		exec "normal! mqI#\<ESC>'q"
		exec "normal! i"
	else
		exec "normal! mqI//\<ESC>`q"
		exec "normal! i"
	endif
endfunc


"keep NERDTree plug stay left when create a new tab
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

