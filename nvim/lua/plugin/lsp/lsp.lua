-- Setup lspconfig.

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local keymap = vim.keymap
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }
	keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	-- Mappings.
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	keymap.set("n", "<leader>F", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
	keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
end

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }) -- show round border when <c-k> pressed

lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["quick_lint_js"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cmake"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
