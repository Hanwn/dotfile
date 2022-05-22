"""
"cocsetting
"""

let g:coc_config_home = $root . '/core/'
let g:coc_default_semantic_highlight_groups = 1

set hidden
set updatetime=100
set shortmess+=c

set hidden
set updatetime=100
set shortmess+=c

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit) 

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>a  <Plug>(coc-codeaction-selected)

inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>
inoremap <silent><expr> <c-o> coc#refresh()
inoremap <silent><expr> <CR> My_mapping()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'setup.py', 'main.py', 'train.py']
autocmd FileType go let b:coc_root_patterns = ['.git', 'go.mod', 'main.go']
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

nnoremap <leader>t :CocCommand explorer<CR>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>k :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


"let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<c-k>'
let g:coc_snippet_next = '<c-j>'

" 'coc-rust-analyzer'
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
    \ 'coc-git']

let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! My_mapping()
  if pumvisible() && complete_info()["selected"] == -1
    return "\<C-y>\<CR>"
  elseif pumvisible()
    return coc#_select_confirm()
  else
    return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  endif
endfunction
