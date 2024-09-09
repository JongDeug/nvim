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
