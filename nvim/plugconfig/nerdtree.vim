"""""
"NERDTree setting
""""""
let g:TreeOnOpen=1
let g:NERDTreeWinSize=20
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
" autocmd BufWinEnter * call BufWinEnterAutoCmd()
" call NERDTree
" autocmd vimenter * :call VimEnterFunc()
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())| q |endif
" autocmd BufWritePost * NERDTreeFocus | exec 'normal R' | wincmd p
func! VimEnterFunc()
	exec ":NERDTree"
	exec "normal \<C-w>\<C-w>"
	"exec ":Tagbar"
endfunc