local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.format_on_save({
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = {'javascript', 'typescript', 'lua'},
  }
})

lsp.setup()

-- NULL LS
local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- js
        formatting.prettier, -- formatting.eslint
        code_actions.eslint, diagnostics.eslint,
        diagnostics.mypy.with({prefer_local = ".venv/bin/"}), -- python
        -- diagnostics.pylint, 
        diagnostics.flake8, diagnostics.ruff.with({prefer_local = ".venv/bin"}),
        -- formatting.ruff.with({prefer_local = ".venv/bin"}), 
        formatting.isort, formatting.black.with({prefer_local = ".venv/bin"}),
        formatting.terraform_fmt, -- terraform
        -- diagnostics.markdownlint,-- Markdown
        -- formatting.markdownlint,
        -- Rust
        formatting.rustfmt, -- other
        -- formatting.lua_format, code_actions.gitsigns
        -- formatting.stylua,

    },
    diagnostics_format = "[#{c}] #{m} (#{s})",
    debug = false,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        timeout_ms = 4000,
                        bufnr = bufnr,
                        filter = function(client)
                            return client.name == "null-ls"
                        end
                    })
                end
            })
        end
    end
})

-- NVIM LSP CONFIG
local nvim_lsp = require("lspconfig")

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    handlers = {["textDocument/publishDiagnostics"] = function() end},
    settings = {python = {analysis = {diagnosticMode = 'openFilesOnly'}}}
}

-- https://github.com/theia-ide/typescript-language-server
nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end
}

-- https://github.com/rust-lang/rust-analyzer
nvim_lsp.rust_analyzer.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end

}
