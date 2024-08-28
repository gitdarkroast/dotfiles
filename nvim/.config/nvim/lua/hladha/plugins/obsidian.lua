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
					path = "/Users/hladha/OneDrive - Absolute Software Corp/ObsidianWork",
				},
			},
		})
	end,
}
