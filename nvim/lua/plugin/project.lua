local project_status, project = pcall(require, "project_nvim")

if not project_status then
	return
end

project.setup({
	detection_methods = { "pattern", "lsp" },
	patterns = { ".git", "go.mod" },
})
