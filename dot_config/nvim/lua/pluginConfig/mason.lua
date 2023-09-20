local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup {
  ensure_installed = {
    "rust_analyzer",
    "pylsp",
    "tsserver",
    "bashls",
    "lua_ls",
    "cssls",
    "html",
    "jsonls",
    "terraformls",
  },
  automatic_installation = true,
}
