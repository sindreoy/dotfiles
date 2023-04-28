-- Leader
vim.g.mapleader = " "
vim.b.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>tt', ':NERDTreeToggle<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>tf', ':NERDTreeFind<CR>', {noremap = true, silent=true})
