local cokeline = require("cokeline")

local get_hex = require('cokeline.hlgroups').get_hl_attr

local yellow = vim.g.terminal_color_3

cokeline.setup({
    sidebar = {
    filetype = {'NvimTree'},
    components = {
      {
        text = function(buf)
          return buf.filetype
        end,
        fg = yellow,
        bg = function() return get_hex('NvimTreeNormal', 'bg') end,
        bold = true,
      },
    }
  },
})

local wk = require("which-key")

wk.register({
  b = {
    name = "Buffers",
  ["n"] = {"<Plug>(cokeline-switch-next)", "Go to next buffer"},
  ["p"] = {"<Plug>(cokeline-switch-prev)", "Go to previous buffer"},
  },
}, {prefix="<leader>"})
