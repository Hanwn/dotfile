"""
"cocsetting
"""

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
let g:coc_global_extensions = [
    \ 'coc-python',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-yank',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-clangd',
	\ 'coc-jedi',
    \ 'coc-go'
  \ ]
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" remove coc.plug not in install list
function! s:uninstall_unused_coc_extensions() abort
    if has_key(g:, 'coc_global_extensions')
        for e in keys(json_decode(join(readfile(expand(g:coc_data_home . '/extensions/package.json')), "\n"))['dependencies'])
            if index(g:coc_global_extensions, e) < 0
                execute 'CocUninstall ' . e
            endif
        endfor
    endif
endfunction
autocmd User CocNvimInit call s:uninstall_unused_coc_extensions()
