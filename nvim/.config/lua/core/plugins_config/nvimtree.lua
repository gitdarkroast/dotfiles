require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local wk = require("which-key")

wk.register({
  e = {"<cmd>NvimTreeToggle<cr>", "Toggle File Explore"},
}, {prefix = "<leader>"})

