local plugin = {}
plugin.name = 'nvim-treesitter.configs' 
plugin.settings = {
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
return plugin
