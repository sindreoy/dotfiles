local M = {
  "neovim/nvim-lspconfig",
  commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
  lazy = true,
}

function M.config()
  local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  end

    local function on_attach(_, bufnr)
	  local function buf_set_option(...)
		  vim.api.nvim_buf_set_option(bufnr, ...)
	  end
	  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    lsp_keymaps(bufnr)
  end


  local lspconfig = require "lspconfig"
  lspconfig.pylsp.setup({
	  on_attach = on_attach,
	  filetypes = { "python" },
	  configurationSources = { "flake8" },
	  settings = {
		  pyls = {
			  plugins = {
				  -- Optional providers
				  rope = {
					  enabled = true,
				  },
				  pyflakes = {
					  enabled = false,
				  },
				  mccabe = {
					  enabled = false,
				  },
				  pycodestyle = {
					  enabled = false,
				  },
				  pydocstyle = {
					  enabled = true,
				  },
				  autopep8 = {
					  enabled = true,
				  },
				  yapf = {
					  enabled = true,
				  },
				  flake8 = {
					  enabled = true,
					  maxLineLength = 160,
				  },
				  pylint = {
					  enabled = false,
				  },
				  -- 3rd Party plugins
				  pyls_mypy = {
					  enabled = true,
				  },
				  pyls_isort = {
					  enabled = true,
				  },
				  pyls_lsp_black = {
					  enabled = true,
				  },
				  pyls_memestra = {
					  enabled = true,
				  },
				  pyls_rope = {
					  enabled = true,
				  },
			  },
		  },
	  },
  })

  lspconfig.tsserver.setup({ on_attach = on_attach, filetypes = { "typescript", "typescriptreact", "typescript.tsx" } })
  lspconfig.vimls.setup({ on_attach = on_attach })
  lspconfig.bashls.setup({ on_attach = on_attach })
  lspconfig.lua_ls.setup({ on_attach = on_attach })
end

return M
