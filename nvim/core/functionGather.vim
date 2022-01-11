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


func! StartWith(longer, shorter)
	return a:longer[0:len(a:shorter) - 1] ==# a:shorter
endfunc


func! HandleTitleLogic(content, sec_num, st)
	let cnt = a:st
	let con_arr = split(a:content, " ")
	while l:cnt < g:SEC
		let a:sec_num[l:cnt] = 0
		let l:cnt += 1
	endwhile
	let cnt = a:st
	let a:sec_num[l:cnt - 1] += 1
	let pendding_num = join(a:sec_num[:l:cnt - 1], '.') . '.'
	if len(con_arr) == 2
		return join([con_arr[0], pendding_num, con_arr[1]], ' ')
	elseif len(con_arr) > 2
		if match(con_arr[1], '\(\d\{1,9}\.\)\+\s') >= 0
			return join([con_arr[0]] + [pendding_num] + con_arr[2:-1], " ")
		else
			return join([con_arr[0]] + [pendding_num] + con_arr[1:-1], " ")
		endif
	endif
endfunc


func! AddOrUpdateSectionNumber()
	let lines = line("$")
	let line = 1
	let g:SEC = 6
	let sec_num = [0,0,0,0,0,0]
	let beg = 0

	while line <= lines
		let content = getline(line)
		if StartWith(content, "```")
			if beg == 1
				let beg = 0
			else
				let beg = 1
			endif
		endif
		if beg == 1
			let line += 1
			continue
		endif
		let st = 6
		if StartWith(content, "######")
			let st = 6
			let cur_line_content = HandleTitleLogic(content, sec_num, st)
			call setline(line, cur_line_content)
		elseif StartWith(content, "#####")
			let st = 5
			let l:cur_line_content = HandleTitleLogic(content, sec_num, st)
			call setline(line, cur_line_content)
		elseif StartWith(content, "####")
			let st = 4
			let l:cur_line_content = HandleTitleLogic(content, sec_num, st)
			call setline(line, cur_line_content)
		elseif StartWith(content, "###")
			let st = 3
			let l:cur_line_content = HandleTitleLogic(content, sec_num, st)
			call setline(line, cur_line_content)
		elseif StartWith(content, "##")
			let st = 2
			let l:cur_line_content = HandleTitleLogic(content, sec_num, st)
			call setline(line, cur_line_content)
		elseif StartWith(content, "#")
			let st = 1
			let l:cur_line_content = HandleTitleLogic(content, sec_num, st)
			call setline(line, cur_line_content)
		endif
		let line += 1
	endwhile
endfunc



"""""
"test area
""""""
