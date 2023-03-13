return {
	"nixprime/cpsm",
	"romgrk/fzy-lua-native",
	{
		"gelguy/wilder.nvim",
		event = "VimEnter",
		config = function()
			require("user.wilder")
		end,
	},
	{
		"catppuccin/nvim",
		as = "catppuccin",
	},
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- "andweeb/presence.nvim",
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
}
