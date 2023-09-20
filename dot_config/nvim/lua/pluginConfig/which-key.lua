local wk = require "which-key"
wk.register {
  ["<leader>/"] = "Toggle linewise comment",
  ["<leader>e"] = "Toggle file tree",
  ["<leader>h"] = "Remove highlight",
  ["<leader>f"] = { name = "Telescope" },
  ["<leader>g"] = { name = "Git" },
  ["<leader>l"] = { name = "LSP" },
}
wk.setup {}
