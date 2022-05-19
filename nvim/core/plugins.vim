"""""""""""""""
"Plug install postion
""""""""""""""

call plug#begin('~/.vim/plugged')
"""layout {{{
Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
"Plug 'airblade/vim-gitgutter'
"""}}}

""" markdown {{{
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'plasticboy/vim-markdown'
""" }}}

" Plug 'SirVer/ultisnips'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
" Plug 'Yggdroot/LeaderF'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'preservim/nerdcommenter'
Plug 'tyru/caw.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'matze/vim-move'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/vim-cursorword'
Plug 'wakatime/vim-wakatime'
Plug 'easymotion/vim-easymotion'

""" *********STAR********
Plug 'neoclide/coc.nvim',{'branch':'release'}
"""

"""
"defx {{{
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'kristijanhusak/defx-icons'
"Plug 'kristijanhusak/defx-git'

"}}}
"""

""" nerdtree {{{
" Plug 'preservim/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'Xuyuanp/nerdtree-git-plugin'
"""}}}

""" themes {{{
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
"""}}}
call plug#end()

""colorscheme setting
"colorscheme nord
"colorscheme gruvbox
colorscheme onedark
