
lua << EOF

require('nvim-treesitter.configs').setup{
    highlight = {
        enable=true,
        disable={}
    },
    ensure_installed = {
        "go",
        "python",
        "c",
        "cpp"
    }
}

EOF
