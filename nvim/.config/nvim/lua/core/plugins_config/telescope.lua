local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local transform_mod = require("telescope.actions.mt").transform_mod

local trouble = require("trouble")
local trouble_telescope = require("trouble.providers.telescope")

local custom_actions = transform_mod({
	open_trouble_qflist = function(prompt_buffer)
		trouble.toggle("quickfix")
	end,
})

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
				["<C-t>"] = trouble_telescope.smart_open_with_trouble,
			},
		},
	},
})

-- load fuzzy finder
telescope.load_extension("fzf")

local wk = require("which-key")

wk.register({
	f = {
		name = "find",
		f = { "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd" },
		r = { "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
		d = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
		c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor cwd" },
		t = { "<cmd>TodoTelescope<cr>", "Find ToDos" },
	},
}, { prefix = "<leader>" })
