return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			mode = "term",
			focus = true,
			startinsert = true,
			term = {
				position = "bot",
				size = 10,
			},
			filetype = {
				-- javascript = "NODE_OPTIONS='--experimental-modules --experimental-json-modules --es-module-specifier-resolution=node' node $dir/$fileName",
				javascript = function()
					local file = vim.fn.expand("%:p")
					return string.format('node "%s"', file)
				end,

				typescript = function()
					local file = vim.fn.expand("%:p")
					return string.format('ts-node "%s"', file)
				end,
			},
		})
	end,
}
