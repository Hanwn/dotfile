""""""""""""""
"Key Mapping
""""""""""""""
map <C-q> <nop>
map Q :bd<CR>
" map R :NERDTreeRefreshRoot<CR>
nnoremap sv :set splitright<CR>:vsplit<CR>
nnoremap sh :set splitbelow<CR>:split<CR> 

nnoremap < <<
nnoremap > >>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" noremap <leader>x :bp<cr>:bd #<cr>
noremap <leader>x :wq<CR>

noremap  <expr>0     col('.') == 1 ? '^': '0'
"nnoremap vn :set splitright<CR>:vne<CR>
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k
"nnoremap tt :NERDTreeToggle<CR>
nnoremap <leader>t :CocCommand explorer<CR>
"nnoremap tree :Defx -columns=git:mark:indent:icons:filename:type -toggle -auto-cd -search=`expand('%:p')` `getcwd()`<CR>
nnoremap <leader>v :Vista!!<CR>
nnoremap <leader>f :Ag<CR>
nnoremap Y y$
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <C-w><down> :res -5<CR>
nnoremap <C-w><up> :res +5<CR>
nnoremap <C-w><left> :vertical resize-5<CR>
nnoremap <C-w><right> :vertical resize+5<CR>
nnoremap <leader><CR> :nohlsearch<CR>
nnoremap <leader>n :tabe<CR>
nnoremap [t :-tabnext<CR>
nnoremap ]t :+tabnext<CR>
nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>
nnoremap <leader>6 :tabn 6<CR>
nnoremap <leader>7 :tabn 7<CR>
nnoremap <leader>8 :tabn 8<CR>
nnoremap <leader>9 :tabn 9<CR>
nnoremap <leader>0 :tabn 10<CR>
nnoremap [b :bp<CR>
nnoremap ]n :bn<CR>
nnoremap { A {}<ESC>F{a
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap H 0
nnoremap L $

inoremap jj <esc>

"""""
"hight current line number
"""""
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermbg=yellow
highlight CursorLineNr ctermfg=Darkred
highlight CursorLineNr cterm=bold
