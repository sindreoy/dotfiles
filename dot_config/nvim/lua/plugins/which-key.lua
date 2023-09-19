local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
}

function M.config()
  local wk = require("which-key")
  wk.register({
    ["<leader>/"] = "Toggle linewise comment",
    ["<leader>e"] = "Toggle file tree",
    ["<leader>h"] = "Remove highlight",
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>g"] = { name = "Git" },
    ["<leader>l"] = { name = "LSP" },
  })
  wk.setup{}
end

return M
