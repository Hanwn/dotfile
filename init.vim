"
" _____      _ _         _           
"|_   _|    (_) |       (_)          
"  | | _ __  _| |___   ___ _ __ ___  
"  | || '_ \| | __\ \ / / | '_ ` _ \ 
" _| || | | | | |_ \ V /| | | | | | |
" \___/_| |_|_|\__(_)_/ |_|_| |_| |_|

let $root = fnamemodify(expand('<sfile>'), ':h')
source $root/core/load.vim



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



"""""
"test area
""""""


