return {
  "neovim/nvim-lspconfig",

  dependencies = {
    {"hrsh7th/cmp-nvim-lsp"},
    {"williamboman/mason-lspconfig.nvim"},
  },
  config = function()
    local icons = require("config.icons")
    local signs = {
      Error = icons.diagnostics.Error,
      Warn = icons.diagnostics.Warn,
      Hint = icons.diagnostics.Hint,
      Info = icons.diagnostics.Info
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require("lspconfig")
    -- local default_lsp = { "clangd", "gopls", "pyright", "tsserver", "bashls" }
    -- for _, lsp in pairs(default_lsp) do
    --   lspconfig[lsp].setup{
    --     capabilities = capabilities
    --   }
    -- end

    require("mason-lspconfig").setup({
        automatic_installation = true,
    })

    lspconfig.clangd.setup({})
    lspconfig.rls.setup({})
    lspconfig.gopls.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.cmake.setup({})
    lspconfig.lua_ls.setup({
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
  end
}
