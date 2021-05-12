
""""""""""""""
" AsyncRun setting
"Quickly AsyncRun
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

let g:quickrun_no_default_key_mappings = 1
let g:asyncrun_open=8
