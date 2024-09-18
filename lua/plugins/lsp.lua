local mapKey = require("utils.keyMapper").mapKey

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "svelte" },
			})
		end,
	},

	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.svelte.setup({})
			lspconfig.ts_ls.setup({
				init_options = require("nvim-lsp-ts-utils").init_options,
				on_attach = function(client, bufnr)
					local ts_utils = require("nvim-lsp-ts-utils")
					ts_utils.setup({})
					ts_utils.setup_client(client)
				end,
			})
		end,
	},
}
