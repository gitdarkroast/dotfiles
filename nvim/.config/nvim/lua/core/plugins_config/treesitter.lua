local treesitter = require("nvim-treesitter")
local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "lua",
    "cpp",
    "python",
  },

  highlight = {
    enable = true,
    disable = {""},
    additional_vim_regex_highlighting = true,
  },

  autopairs = {
    enable = true,
  },

  indent = {
    enable = true,
  },
})
