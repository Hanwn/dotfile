let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore-dir={node_modules,build,.vscode,.git,.cache,.idea} -g ""'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden --ignore-dir={node_modules,build,.vscode,.idea,.cache,.git}', fzf#vim#with_preview(), <bang>0)

