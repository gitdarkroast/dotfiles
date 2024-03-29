-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		relativenumber = true,
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	filters = {
		dotfiles = false, -- show dotfiles
	},
	actions = {
		open_file = {
			window_picker = {
				enable = true,
			},
		},
	},
})

local wk = require("which-key")

wk.register({
	e = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explore" },
}, { prefix = "<leader>" })
