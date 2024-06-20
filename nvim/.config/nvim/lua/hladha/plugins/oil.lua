return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		local detail = false

		oil.setup({
			default_file_explorer = true,
			keymaps = {
				["gd"] = {
					desc = "Toggle file detail view",
					callback = function()
						detail = not detail
						if detail then
							require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
						else
							require("oil").set_columns({ "icon" })
						end
					end,
				},
			},
		})
	end,
}
