local trouble = require("trouble")
trouble.setup({
	keys = {
		{},
	},
})

local wk = require("which-key")
wk.register({
	x = {
		name = "Diagnostics",
		["x"] = { "<cmd>TroubleTogglw<CR>", "Toggle diagnostic display" },
		["w"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Display diagnostic list for entire workspace" },
		["d"] = { "<cmd>TroubleToggle document_diagnostics<CR>", "Display diagnostic list for current buffer" },
		["q"] = { "<cmd>TroubleToggle quickfix<CR>", "Display quickfix list" },
		["l"] = { "<cmd>TroubleToggle loclist<CR>", "Display location list" },
		["t"] = { "<cmd>TodoTrouble<CR>", "Display TODO list" },
	},
}, { prefix = "<leader>" })
