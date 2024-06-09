return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- default settings
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
