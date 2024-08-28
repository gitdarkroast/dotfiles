return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})
	end,
	vim.keymap.set("n", "<leader>m", function()
		require("harpoon"):list():add()
	end),
	vim.keymap.set("n", "<leader>ht", function()
		require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
	end),
}
