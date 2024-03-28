local bufferline = require("bufferline")

vim.opt.termguicolors = true

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		style_preset = bufferline.style_preset.no_italic,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})

local wk = require("which-key")

wk.register({
	b = {
		name = "Buffers",
		["n"] = { "<Plug>(cokeline-switch-next)", "Go to next buffer" },
		["p"] = { "<Plug>(cokeline-switch-prev)", "Go to previous buffer" },
	},
}, { prefix = "<leader>" })
