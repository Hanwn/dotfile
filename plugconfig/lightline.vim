""""
"lightline setting
""""
let g:lightline = { 
		\ 'colorscheme': 'onedark',
 		\ 'component': { 
 		\   'lineinfo': '⭡ %3l:%-2v', 
 		\ }, 
        \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \ 			[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
 		\ 'component_function': {
		\   'gitbranch': 'LightlineFugitive',
		\ 	'readonly':'LightlineReadonly'
 		\ }, 
 		\ 'separator': { 'left': '', 'right': '' }, 
 		\ 'subseparator': { 'left': '', 'right': '' } 
 		\ } 
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! LightlineFugitive() 
	let branch = gitbranch#name() 
	return branch !=# '' ? ''.branch : '' 
endfunction 
