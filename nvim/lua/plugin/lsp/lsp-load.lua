  -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['gopls'].setup {
capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
capabilities = capabilities
}
require('lspconfig')['pyright'].setup {
capabilities = capabilities
}
require('lspconfig')['sumneko_lua'].setup {
capabilities = capabilities
}

require('lspconfig')['bashls'].setup {
capabilities = capabilities
}

