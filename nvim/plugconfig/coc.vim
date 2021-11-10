"""
"cocsetting
"""

let g:coc_config_home = $root . '/core/'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'setup.py', 'main.py', 'train.py']
autocmd FileType go let b:coc_root_patterns = ['.git', 'go.mod', 'main.go']

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:coc_global_extensions = [
    \ 'coc-explorer',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-yank',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-clangd',
	\ 'coc-pyright',
    \ 'coc-go',
    \ 'coc-rust-analyzer'
  \ ]
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

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

"let g:coc_snippet_next = '<tab>'

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
