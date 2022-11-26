local project_status, project = pcall(require, "project_nvim")

project.setup({
    patterns = { ".git", "go.mod", "_darcs", ".hg", ".bzr", ".svn", "Makefile" },
})
