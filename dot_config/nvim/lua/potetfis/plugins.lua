-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Telescope for fuzzy finder
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
  -- NerdTree
  use 'preservim/nerdtree'

  -- LSP
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  -- End LSP
  use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = {"nvim-lua/plenary.nvim"}
  })


  -- Colors for devicons
  use 'bryanmylee/vim-colorscheme-icons'
  -- DevIcons, always end with this plugin
  use 'ryanoasis/vim-devicons'
  -- Remember to install fonts, see
  -- https://github.com/ryanoasis/nerd-fonts#option-3-install-script
end)
