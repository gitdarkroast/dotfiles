-- lua/hladha/plugins/formatting.lua
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.lua", "*.py", "*.ts", "*.js", "*.json", "*.yml", "*.yaml", "*.md" },
			callback = function(args)
				require("conform").format({ bufnr = args.buf, lsp_fallback = true })
			end,
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer or range" })
	end,
}
