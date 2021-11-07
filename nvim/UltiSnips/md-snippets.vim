autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,F <Esc>?<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,u <u></u> <++><Esc>Fu2hi
autocmd Filetype markdown inoremap <buffer> ,r <font color='red'></font> <++><Esc>Ff2hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,E $$<ENTER><ENTER>$$<Enter><Enter><++><Esc>3kA
autocmd Filetype markdown inoremap <buffer> ,e $$ <++><Esc>F$i
autocmd Filetype markdown inoremap <buffer> ,t - [ ] 
autocmd Filetype markdown inoremap <buffer> ,m <++>
autocmd Filetype markdown inoremap <buffer> ,p <center><img src='' height=400px></img></center><++><Esc>F'i
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><Enter><Enter><++><Esc>3kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><Enter><Enter><++><Esc>3kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><Enter><Enter><++><Esc>3kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><Enter><Enter><++><Esc>3kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
