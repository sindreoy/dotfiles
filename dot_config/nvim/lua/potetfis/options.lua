-- Side numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse
vim.api.nvim_set_option("mouse", "a")

-- Scroll
vim.wo.scroll = 0
vim.wo.scrolloff = 3

-- Encoding
vim.api.nvim_set_option("encoding", "utf-8")

vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "kj", "<ESC>", {noremap = true, silent = true})

--  Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
vim.o.splitright = true
vim.o.splitbelow = true

-- enable syntax highlighting
vim.cmd("syntax on")
-- enable filetype detection
vim.cmd("filetype plugin indent on")

-- Tab stuff
vim.o.tabstop = 4
-- implicit tab size
vim.o.softtabstop = 4
-- another kind of stabstop
vim.o.shiftwidth = 4
-- convert tabs to spaces
vim.o.expandtab = true
vim.o.autoindent = true


