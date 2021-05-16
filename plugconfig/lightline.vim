""""
"lightline setting
""""
let g:lightline = { 
		\ 'colorscheme': 'onedark',
        \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \ 			[ 'gitbranch', 'readonly', 'filename', 'cocerror','cocwarn' ] ],
        \ 'right':[['lineinfo'],['percent'],['fileencoding'],['platform']]
        \ },
 		\ 'component': { 
 		\   'lineinfo': " %{line('.') . '/' . line('$')}", 
 		\ }, 
 		\ 'component_function': {
		\   'gitbranch': 'LightlineFugitive',
		\ 	'readonly':'LightlineReadonly',
        \   'filename':'LightLineFname',
		\	'cocerror':'GetCocError',
        \   'cocwarn':'GetCocWarn',
        \   'platform':'GetPlatFormFormat',
 		\ }, 
 		\ 'separator': { 'left': '', 'right': '' }, 
 		\ 'subseparator': { 'left': '', 'right': '' } 
 		\ } 
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive() 
	let branch = gitbranch#name() 
	return branch !=# '' ? ' '.branch.' '.LightLineGitGutter() : '' 
endfunction 


fu! GetCocError()
    let error_sign = get(g:, 'coc_status_error_sign', " ")
    let info       = get(b:, 'coc_diagnostic_info', {})
    if !empty(info) && get(info, 'error')
        return error_sign . info['error']
    endif
    return ""
endf

fu! GetCocWarn() abort
    let warning_sign = get(g:, 'coc_status_warning_sign', "❗")
    let info         = get(b:, 'coc_diagnostic_info', {})
    if !empty(info) && get(info, 'warning')
        return warning_sign . info['warning']
    endif
    return ""
endf


function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '')        
endfunction

function! LightLineFname() 
  let icon = (strlen(&filetype) ? ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') 
  let filename = LightLineFilename()
  let modified = LightLineModified()
  let ret = filename . icon
  if filename == ''
    return ''
  endif
  return join([ret, modified],' ')
  "return join([filename, icon],'')
endfunction

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return ""
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

fu! GetPlatFormFormat()
    return " " . WebDevIconsGetFileFormatSymbol()
endf
function! LightLineGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = ['+','~','-']
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction
