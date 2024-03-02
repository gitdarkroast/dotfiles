local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  }
})

-- load fuzzy finder
telescope.load_extension("fzf")

local wk = require("which-key")

wk.register({
  f = {
    name = "find",
    f = {"<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd"},
    r = {"<cmd>Telescope oldfiles<cr>", "Fuzzy find recebt files"},
    g = {"<cmd>Telescope live_grep<cr>", "Find string in cwd"},
    c = {"<cmd>Telescope grep_string<cr>", "Find string under cursor cwd"},
    t = {"<cmd>Telescope help_tags<cr>", "Find Tags"},
  },
}, {prefix = "<leader>"})
