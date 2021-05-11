"
"cocsetting
"""
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
let g:coc_global_extensions = [
    \ 'coc-python',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-yank',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-clangd',
	\ 'coc-jedi'
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
let g:VM_maps['Find Under'] = '<C-m>'
let g:VM_maps['Find Subword Under'] = '<C-m>'


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
