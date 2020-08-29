"""""""""""
"Set area
""""""""""""
let mapleader=","
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
set smartcase
set expandtab
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


noremap  <expr>0     col('.') == 1 ? '^': '0'
nnoremap <C-N> :set splitright<CR>:vne<CR>
nnoremap J 5j
nnoremap K 5k
nnoremap tt :NERDTreeToggle<CR>
nnoremap tag :Vista!!<CR>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <C-w><down> :res -5<CR>
nnoremap <C-w><up> :res +5<CR>
nnoremap <C-w><left> :vertical resize-5<CR>
nnoremap <C-w><right> :vertical resize+5<CR>
nnoremap <leader><CR> :nohlsearch<CR>
nnoremap <tab>n :tabe<CR>
nnoremap <tab>h :-tabnext<CR>
nnoremap <tab>l :+tabnext<CR>
nnoremap { A {}<ESC>F{a


inoremap jj <esc>

"""""
"hight current line number
"""""
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermbg=yellow
highlight CursorLineNr ctermfg=Darkred
highlight CursorLineNr cterm=bold

"""""
"highlight python code
"""""


""""""""""""""
"Quickly Run
""""""""""""
map<F5> : call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "AsyncRun gcc % -o %<"
		exec "AsyncRun  ./%<"
	elseif &filetype == 'cpp'
		exec "AsyncRun  g++ % -std=c++11 -o %<"
		exec "AsyncRun /%<"
	elseif &filetype == 'python'
		exec "AsyncRun time python %"
	elseif &filetype == 'javascript'
		exec "AsyncRun node %"
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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'liuchengxu/vista.vim'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF'
Plug 'skywind3000/asyncrun.vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'morhetz/gruvbox'
Plug 'itchyny/vim-cursorword'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
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


"""
"cocsetting
"""
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
let g:coc_global_extensions = [
    \ 'coc-python',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-snippets',
    \ 'coc-yank',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-clangd'
  \ ]

"""""
"airline setting
""""""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter="jsformatter"
let g:airline#extensions#tabline#show_tab_count=2
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#exclude_preview=1

"""""
"""""""""


let g:quickrun_no_default_key_mappings = 1


"""""
"Indent line
"""""
let g:indentLine_setConceal = 0
let g:indentLine_concealcursor = ""
let g:indentLine_fileType = ['c','cpp','python','javascript','go','java']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


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

"Used to select word by enter key
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""""""
"markdown short cut
"""""""
source ~/.vim/md-snippets.vim


""""
"vista setting
""""
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


""""
"vim visual multi setting

""""
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'


""""""
"asyncrun setting
""""""
let g:asyncrun_open=8
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }

""""""
"LeaderF setting
""""""
let g:Lf_ShortcutF = '<C-p>'
noremap ,b :LeaderfBuffer<CR>
noremap ,l :LeaderfLine<CR>
noremap ,f :LeaderfFunction<CR>


""""
"floaterm setting
""""
nmap ter ::FloatermToggle<CR>
