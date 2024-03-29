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

vim.api.nvim_create_user_command("CloseBuffer", function()
	vim.cmd([[NvimTreeClose]])
	vim.cmd([[bdelete!]])
end, {})

wk.register({
	b = {
		name = "Buffers",
		["n"] = { "<cmd>BufferLineCycleNext<CR>", "Go to next buffer" },
		["p"] = { "<cmd>BufferLineCyclePrev<CR>", "Go to previous buffer" },
		["x"] = { "<cmd>CloseBuffer<CR>", "Delete current buffer" },
	},
}, { prefix = "<leader>" })
