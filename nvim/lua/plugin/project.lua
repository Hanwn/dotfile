local plugin = {}
plugin.name = "project_nvim"
plugin.settings = {
    patterns = { ".git", "go.mod", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
}

return plugin
