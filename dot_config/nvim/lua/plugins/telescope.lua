local M = {
  "nvim-telescope/telescope.nvim",
  commit = "b543aaa2c9cf8123ed2fe7dbb6c211a9cd415124",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
    },
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
  },
}

-- local actions = require "telescope.actions"
function M.config()
  local actions = require "telescope.actions"
  local telescope = require "telescope"
  telescope.setup{
    defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  }
end

return M
