require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Connect Mason with lspconfig
require("mason-lspconfig").setup({
  -- Automatically install these servers
  ensure_installed = {
    "ts_ls",       -- TypeScript/JavaScript
    "phpactor",    -- PHP
    "gopls",       -- Go
  },
  automatic_installation = true,
  automatic_enable = true
})
