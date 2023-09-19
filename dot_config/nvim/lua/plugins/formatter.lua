local M = {
  "mhartington/formatter.nvim",
  commit = "44c89f09dcc220dc2a9b056e93c3a87c86e79804"
}

function M.config()
  local formatter = require("formatter")
  formatter.setup({
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {

      -- Lua
      lua = { formatter.filetypes.lua.stylua },

      -- Python
      python = {
        formatter.filetypes.python.black,
        formatter.filetypes.python.isort,
      },

      typescript = {
        formatter.filetypes.typescript.prettier,
      },

      typescriptreact = {
        formatter.filetypes.typescriptreact.prettier,
      },

      markdown = {
        formatter.filetypes.markdown.prettier,
      },

      ["*"] = {
        formatter.filetypes.any.remove_trailing_whitespace,
        formatter.filetypes.any.prettier,
      },
    },
  })
end

return M
