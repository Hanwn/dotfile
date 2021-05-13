# MyInitVim

![initvim](initvim.png) 


## Dir
```
├── App.md
├── README.md
├── UltiSnips
│   ├── cpp.snippets
│   ├── markdown.snippets
│   ├── md-snippets.vim
│   └── python.snippets
├── coc-settings.json
├── core
│   ├── load.vim
│   ├── mappings.vim
│   ├── plugins.vim
│   └── variables.vim
├── init.vim
└── plugconfig
    ├── airline.vim
    ├── asyncrun.vim
    ├── coc.vim
    ├── defx.vim
    ├── floaterm.vim
    ├── indentline.vim
    ├── leaderf.vim
    ├── lightline.vim
    ├── nerdtree.vim
    ├── snippets.vim
    ├── vista.vim
    └── visualmulti.vim
```


* file
	- coc-settings.json : config file used to complete
	- init.vim : vim config file



## Key map


## Plugin

* My vimrc plug:

	* Plug 'itchyny/lightline.vim'
	* Plug 'itchyny/vim-gitbranch'
	* Plug 'jiangmiao/auto-pairs'
	* Plug 'liuchengxu/vista.vim'
	* Plug 'voldikss/vim-floaterm'
	* Plug 'mhinz/vim-startify'
	* Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	* Plug 'plasticboy/vim-markdown'
	* Plug 'godlygeek/tabular'
	* Plug 'SirVer/ultisnips'
	* Plug 'Chiel92/vim-autoformat'
	* Plug 'tpope/vim-surround'
	* Plug 'sheerun/vim-polyglot'
	* Plug 'Yggdroot/indentLine'
	* Plug 'Yggdroot/LeaderF'
	* Plug 'skywind3000/asyncrun.vim'
	* Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	* Plug 'matze/vim-move'
	* Plug 'ryanoasis/vim-devicons'
	* Plug 'itchyny/vim-cursorword'
	* Plug 'neoclide/coc.nvim',{'branch':'release'}
	* Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
	* Plug 'kristijanhusak/defx-icons'
	* Plug 'kristijanhusak/defx-git'
	* Plug 'morhetz/gruvbox'
	* Plug 'joshdick/onedark.vim'


* table describe

| Number | Rec                            | plug Name                    | Desc                                |
|:------:|:------------------------------:|-----------------------------:|:------------------------------------|
| 1      | :star::star::star::star:       | itchyny/lightline.vim        | status column                       |
| 2      | :star:                         | itchyny/vim-gitbranch        | show git branch name                |
| 3      | :star::star::star::star:       | jiangmiao/auto-pairs         | auto complete {} () []              |
| 4      | :star::star::star:             | liuchengxu/vista.vim         | show tags, acquired ctags support   |
| 5      | :star::star::star::star::star: | voldikss/vim-floaterm        | float terminal                      |
| 6      | :star::star:                   | mhinz/vim-startify           | start menu                          |
| 7      | :star::star::star::star::star: | iamcco/markdown-preview.nvim | markdown preview using broswer      |
| 8      | :star::star::star:             | plasticboy/vim-markdown      | hihtlight markdown syntax           |
| 9      | :star::star::star::star:       | godlygeek/tabular            | format table                        |
| 10     | :star::star::star:             | SirVer/ultisnips             | code snippets                       |
| 11     | :star::star::star:             | Chiel92/vim-autoformat       |                                     |
| 12     | :star::star::star:             | tpope/vim-surround           | add sign between a word or sentence |
| 13     | :star::star::star::star:       | sheerun/vim-polyglot         | choose plugin automatically         |
| 14     | :star::star::star:             | Yggdroot/indentLine          | indent line for python              |
| 15     | :star::star::star::star:       | Yggdroot/LeaderF             | search content                      |
| 16     | :star::star::star:             | skywind3000/asyncrun.vim     | run code                            |
| 17     | :star::star::star::star:       | mg979/vim-visual-multi       | multi cursor                        |
| 18     | :star::star::star:             | matze/vim-move               | move code                           |
| 19     | :star::star::star:             | ryanoasis/vim-devicons       | icons                               |
| 20     | :star::star::star::star:       | itchyny/vim-cursorword       | highlight current word              |
| 21     | :star::star::star::star::star: | neoclide/coc.nvim            | Main function:complete              |
| 22     | :star::star::star::star:       | Shougo/defx.nvim             | tree file                           |
| 23     | :star::star::star::star:       | kristijanhusak/defx-icons    | icon in defx                        |
| 24     | :star::star::star::star:       | kristijanhusak/defx-git      | git mark                            |
| 25     | :star::star::star:             | morhetz/gruvbox              | theme                               |
| 26     | :star::star::star::star:       | joshdick/onedark.vim         | theme                               |




**Note** in coc managerment, install plug behind
- coc-tsserver
- coc-python 

Their coc-settings.json file save config and detail info can refer to their repo perspactivly

* plug set place
