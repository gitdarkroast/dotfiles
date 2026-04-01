return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- 1) Mason core (UI only)
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- 2) Make sure these LSP servers are installed (install-time only)
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"emmet_ls",
				-- add more here as needed; enabling happens in your lspconfig.lua
			},
			-- no handlers here; we rely on vim.lsp.config/enable in lspconfig.lua
		})

		-- 3) Ensure non-LSP dev tools are present (formatters/linters/etc.)
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- JS/TS/CSS/MD formatter
				"stylua", -- Lua formatter (NOT an LSP)
				"isort", -- Python import sorter
				"black", -- Python formatter
				"pylint", -- Python linter
				"eslint_d", -- JS/TS linter
			},
			auto_update = false,
			run_on_start = true,
		})
	end,
}
