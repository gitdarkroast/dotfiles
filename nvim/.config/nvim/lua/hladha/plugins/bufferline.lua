return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			-- style_preset = bufferline.style_preset.no_italic,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true, -- use a "true" to enable the default, or set your own character
				},
			},
		},
	},
	config = function()
		vim.api.nvim_create_user_command("CloseBuffer", function()
			vim.cmd([[NvimTreeClose]])
			vim.cmd([[bdelete!]])
		end, {})

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
		keymap.set("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
		keymap.set("n", "<leader>bx", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Close current buffer" })
	end,
}
