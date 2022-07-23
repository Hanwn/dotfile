require('nvim-treesitter.configs').setup{
    highlight = {
        enable=true,
        disable={}
    },
    ensure_installed = {
        "c",
        "cpp",
        "go",
        "python",
        "rust",
        "cmake"
    },
}
