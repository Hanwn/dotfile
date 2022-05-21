""""
"lightline setting
""""

let g:lightline#bufferline#enable_devicons=1
let g:lightline = { 
		\ 'colorscheme': 'one',
        \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \ 			[ 'gitbranch', 'readonly' ,'filename', 'method','cocerrorandwarn'] ],
        \ 'right':[['lineinfo'],['percent'],['fileencoding'],['platform']]
        \ },
 		\ 'component': { 
 		\   'lineinfo': " %{line('.') . '/' . line('$')}", 
 		\ }, 
 		\ 'component_function': {
		\   'gitbranch': 'LightlineFugitive',
		\ 	'readonly':'LightlineReadonly',
        \   'filename':'LightLineFname',
		\	'cocerrorandwarn':'GetCocErrorAndWarn',
        \   'platform':'GetPlatFormFormat',
 		\ }, 
 		\ 'separator': { 'left': '', 'right': '' }, 
 		\ 'subseparator': { 'left': '', 'right': '' },
        \ 'tab_component_function' : {
        \   'fiticon':'LightlineTabFiletypeIcon',
        \ },
        \ 'tab' : {
        \  'active': [ 'filename', 'fiticon' ],
        \  'inacive':['tabnum', 'filename']
        \},
        \ 'tabline':{
        \ 'left':[['tabs']],
        \ 'right':[['']],
        \},
 		\ } 
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive() 
    let branch = get(g:, 'coc_git_status', '')
	return branch !=# '' ? branch . LightlineGitStatus() : '' 
endfunction 

fu! GetCocErrorAndWarn()
  let err = GetCocError()
  let warn = GetCocWarn()
  if !empty(err) && !empty(warn)
    return err . '' . warn
  elseif !empty(err)
    return err
  else
    return warn
  endif
endf

fu! GetCocError()
    let error_sign = get(g:, 'coc_status_error_sign', "✘")
    let info       = get(b:, 'coc_diagnostic_info', {})
    if !empty(info) && get(info, 'error')
        return error_sign . info['error']
    endif
    return ""
endf

fu! GetCocWarn() abort
    let warning_sign = get(g:, 'coc_status_warning_sign', "")
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
  let icon = ''
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

function! NearestMethodOrFunction() abort
  return ' ' . get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LightlineTabFiletypeIcon(n)
  let fticon = WebDevIconsGetFileTypeSymbol()
  return fticon !=# '' ? fticon : ''
endfunction

function! LightlineGitStatus() abort
  let blame = get(b:, 'coc_git_status', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction
