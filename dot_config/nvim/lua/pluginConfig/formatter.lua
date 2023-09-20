require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {

    -- Lua
    lua = { require("formatter.filetypes.lua").stylua },

    -- Python
    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },

    typescript = {
      require("formatter.filetypes.typescript").eslint_d,
    },

    typescriptreact = {
      require("formatter.filetypes.typescript").eslint_d,
    },

    markdown = {
      require("formatter.filetypes.markdown").eslint_d,
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
      require("formatter.filetypes.any").eslint_d,
    },
  },
}
