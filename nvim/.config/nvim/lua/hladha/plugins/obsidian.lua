return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local obsidian = require("obsidian")
		obsidian.setup({
			workspaces = {
				{
					name = "Work",
					path = "/Users/hladha/OneDrive - Absolute Software Corp/Obsidian/ObsidianWork",
				},
			},
			templates = {
				folder = "Extras/Templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M:%S",
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>os", ":ObsidianTemplate StandupTemplate<cr>", { desc = "Insert Standup template" })
		keymap.set("n", "<leader>om", ":ObsidianTemplate MeetingTemplate<cr>", { desc = "Insert Meeting template" })
		keymap.set(
			"n",
			"<leader>oo",
			":cd /Users/hladha/OneDrive\\ -\\ Absolute Software Corp/Obsidian/ObsidianWork<cr>"
		)
	end,
}
