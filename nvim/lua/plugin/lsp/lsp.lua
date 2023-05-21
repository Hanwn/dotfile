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

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }) -- show round border when <c-k> pressed

lspconfig["clangd"].setup({
	capabilities = capabilities,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
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
})

lspconfig["quick_lint_js"].setup({
	capabilities = capabilities,
})

lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
})

lspconfig["bashls"].setup({
	capabilities = capabilities,
})

lspconfig["cmake"].setup({
})

lspconfig["lua_ls"].setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
