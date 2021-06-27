let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore={.git,.cache} --ignore-dir={node_modules,build} -g ""'

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden --ignore={.git,.cache} --ignore-dir={node_modules,build}', fzf#vim#with_preview(), <bang>0)

