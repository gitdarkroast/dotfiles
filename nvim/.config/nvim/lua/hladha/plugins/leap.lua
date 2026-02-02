return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		
		vim.keymap.set("n", "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
		vim.keymap.set("n", "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
		vim.keymap.set("x", "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
		vim.keymap.set("x", "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
		vim.keymap.set("o", "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
		vim.keymap.set("o", "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
	end,
}
