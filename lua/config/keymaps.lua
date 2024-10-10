local mapKey = require("utils.keyMapper").mapKey

-- Neotree toggle
mapKey("<leader>1", ":Neotree toggle<cr>")

-- pane navigation
mapKey("<C-h>", "<C-w>h") -- Left
mapKey("<C-j>", "<C-w>j") -- Down
mapKey("<C-k>", "<C-w>k") -- Up
mapKey("<C-l>", "<C-w>l") -- Right

-- clear search highlight
mapKey("<leader>h", ":nohlsearch<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- clipboard
mapKey("<C-c>", '"+y', "v")
mapKey("<leader>Y", 'gg"+yG')

-- Code
mapKey("K", vim.lsp.buf.hover)
mapKey("gd", vim.lsp.buf.definition)
mapKey("<leader>ca", vim.lsp.buf.code_action)
mapKey("<leader>e", vim.diagnostic.open_float)
mapKey("<C-s>", ":w<CR>")

-- Debug
mapKey("<leader>ui", function()
	require("dapui").toggle()
end)
mapKey("<leader>b", function()
	require("dap").toggle_breakpoint()
end)
mapKey("<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition"))
end)
mapKey("<F5>", function()
	require("dap").continue()
end)
mapKey("<F6>", function()
	require("dap").step_out()
end)
mapKey("<F8>", function()
	require("dap").step_over()
end)
mapKey("<F7>", function()
	require("dap").step_into()
end)

-- code runner
mapKey("<leader>r", ":RunCode<CR>")
