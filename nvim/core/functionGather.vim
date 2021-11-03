" close vista auto when the only window close
autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif


"pyfile title
autocmd BufNewFile *.py :call SetTitle()

func! SetTitle()
	call setline(1,"'''")
	call append(line(".")," - Author : hanwn")
	call append(line(".") + 1," - Date : ".strftime("%m-%d-%Y"))
	call append(line(".") + 2," - FileName : ".expand("%:t"))
	call append(line(".") + 3," - Email : hanwn7721@gmail.com")
	call append(line(".") + 4," - Description : ") 
	call append(line(".") + 5,"'''")
	exec "normal G"
endfunc


"""""
"test area
""""""
