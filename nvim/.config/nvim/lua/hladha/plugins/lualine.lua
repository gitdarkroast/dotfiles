return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local noice_status = require("noice.api.status")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_x = {
					{
						noice_status.message.get_hl,
						cond = noice_status.message.has,
					},
					{
						noice_status.command.get,
						cond = noice_status.command.has,
						color = { fg = "#ff9e64" },
					},
					{
						noice_status.mode.get,
						cond = noice_status.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						noice_status.search.get,
						cond = noice_status.search.has,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
