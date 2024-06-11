return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	vim.api.nvim_create_user_command("CloseBuffer", function()
		vim.cmd([[NvimTreeClose]])
		vim.cmd([[bdelete!]])
	end, {}),
	config = function()
		require("bufferline").setup({
			options = {
				style_preset = require("bufferline").style_preset.default,
				mode = "buffers",
				numbers = "buffer_id",
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon", -- | "underline" | "none",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Switch to next buffer" })
		keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Switch to previous buffer" })
		keymap.set("n", "<leader>bx", "<cmd>CloseBuffer<CR>", { desc = "Close current buffer" })
	end,
}
