require("lazy").setup(
{
  -- colorscheme
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000 
  },
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  {
    "nvim-telescope/telescope.nvim", 
    branch = "0.1.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- improve some UI elements
  {
    "stevearc/dressing.nvim",
    event="VeryLazy",
  },

  -- Language server
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "neovim/nvim-lspconfig",
      event = {"BufReadPre", "BufNewFile"},
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {"antosha417/nvim-lsp-file-operations", config=true},
      },
    },
  },

  -- Code completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind.nvim", -- vs-code like pictograms
    }
  },

  "folke/which-key.nvim",
}
)

