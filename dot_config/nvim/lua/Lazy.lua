local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- The entire plugin list
local plugins = {
  -- https://github.com/mhartington/formatter.nvim
  { "mhartington/formatter.nvim" },
  -- https://github.com/goolord/alpha-nvim
  { "goolord/alpha-nvim", commit = "dafa11a6218c2296df044e00f88d9187222ba6b0" },
  -- https://github.com/nvim-telescope/telescope.nvim
  {
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
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "226c1475a46a2ef6d840af9caa0117a439465500",
    event = "BufReadPost",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
        commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
      },
      {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4",
      },
    },
  },
  -- https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "226c1475a46a2ef6d840af9caa0117a439465500",
    event = "BufReadPost",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
        commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
      },
      {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4",
      },
    },
  },
  -- https://github.com/kyazdani42/nvim-tree.lua
  { "kyazdani42/nvim-tree.lua", commit = "59e65d88db177ad1e6a8cffaafd4738420ad20b6", event = "VimEnter" },
  -- https://github.com/folke/which-key.nvim
  { "folke/which-key.nvim", commit = "5224c261825263f46f6771f1b644cae33cd06995", event = "VeryLazy" },
  -- https://github.com/nvim-tree/nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4",
  },
  -- https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    commit = "0e065d423f9cf649e1d92443c939a4b5073b6768",
    event = "InsertEnter",
    dependencies = {
      {
        "hrsh7th/nvim-cmp",
        commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
        event = {
          "InsertEnter",
          "CmdlineEnter",
        },
      },
    },
  },
  -- https://github.com/akinsho/bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    commit = "c7492a76ce8218e3335f027af44930576b561013",
    event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
    dependencies = {
      {
        "famiu/bufdelete.nvim",
        commit = "8933abc09df6c381d47dc271b1ee5d266541448e",
      },
    },
  },
  -- https://github.com/ahmedkhalf/project.nvim
  {
    "ahmedkhalf/project.nvim",
    commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
        event = "Bufenter",
        cmd = { "Telescope" },
      },
    },
  },
  -- http://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    commit = "eab2c83a0207369900e92783f56990808082eac2",
    event = "BufRead",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
        commit = "a0f89563ba36b3bacd62cf967b46beb4c2c29e52",
      },
    },
  },
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    commit = "ec4742a7eebf68bec663041d359b95637242b5c3",
    event = "BufReadPre",
  },
  -- https://github.com/RRethy/vim-illuminate
  {
    "RRethy/vim-illuminate",
    commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
    event = "VeryLazy",
  },
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
    event = "BufReadPre",
  },
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    commit = "0050b308552e45f7128f399886c86afefc3eb988",
    event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  },
  -- https://github.com/akinsho/toggleterm.nvim
  {
    "akinsho/toggleterm.nvim",
    commit = "19aad0f41f47affbba1274f05e3c067e6d718e1e",
    event = "VeryLazy",
  },
  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477",
    cmd = "Mason",
    event = "BufReadPre",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
        lazy = true,
      },
    },
  },
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
    lazy = true,
  },
  -- https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
      },
      {
        "hrsh7th/cmp-buffer",
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
      },
      {
        "hrsh7th/cmp-path",
        commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
      },
      {
        "hrsh7th/cmp-cmdline",
        commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
      },
      {
        "saadparwaiz1/cmp_luasnip",
        commit = "18095520391186d634a0045dacaa346291096566",
      },
      {
        "L3MON4D3/LuaSnip",
        commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208",
        event = "InsertEnter",
        dependencies = {
          "rafamadriz/friendly-snippets",
          commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7",
        },
      },
      {
        "hrsh7th/cmp-nvim-lua",
        commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
      },
    },
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
  },
}

local opts = {}
require("lazy").setup(plugins, opts)
