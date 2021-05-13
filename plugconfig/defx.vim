"""
"defx setting
"""
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✗',
  \ 'Unknown'   : '?'
  \ })

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
augroup defxsettings
  autocmd!

  func! MyT(context) abort
	if isdirectory(get(a:context.targets, 0)) == 0
	  call defx#call_action('drop', 'tabe')
	endif
  endfunc 

  " Set common settings.
  autocmd FileType defx setlocal statusline=defx signcolumn=yes

  " Set mappings.
  autocmd FileType defx call s:defxmappings()

  function! s:defxmappings() abort
    " Navigation
    nnoremap <buffer><silent><expr> l
      \ defx#is_directory()
        \ ? defx#do_action('open_or_close_tree')
        \ : defx#do_action('drop')
    nnoremap <buffer><silent><expr> <2-LeftMouse>
      \ defx#is_directory()
        \ ? defx#do_action('open_or_close_tree')
        \ : defx#do_action('drop')
    "nnoremap <buffer><silent><expr> j defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
    nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
    nnoremap <silent><buffer><expr> l defx#do_action('open_tree')
    nnoremap <silent><buffer><expr> h defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
    nnoremap <silent><buffer><expr> C defx#do_action('copy')
    nnoremap <silent><buffer><expr> P defx#do_action('paste')
    nnoremap <silent><buffer><expr> M defx#do_action('rename')
    nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
    nnoremap <silent><buffer><expr> R defx#do_action('redraw')  
  endfunction
augroup end

scriptencoding UTF-8
let g:defx_icons_enable_syntax_highlight = v:true
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

let g:defx_icons_exact_matches ={
  \ 'makefile': {'icon': '', 'color': '4c566a'},
  \ 'cmakelists.txt': {'icon': '', 'color': '4c566a'},
  \ '.gitignore': {'icon': '', 'color': '5c6773'},
  \ 'license': {'icon': '', 'color': 'c2e98d'},
  \ 'conf': {'icon': '', 'color': '4c566a'},
  \ }

call defx#custom#column('mark', {
  \ 'readonly_icon': '✗',
  \ 'selected_icon': '✓',
  \ })

autocmd FileType defx setlocal nonumber
autocmd FileType defx setlocal norelativenumber
autocmd FileType defx setlocal signcolumn=no
