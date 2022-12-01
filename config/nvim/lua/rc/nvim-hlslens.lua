require("hlslens").setup({
	-- calm_down = true,
	-- nearest_only = true,
	-- nearest_float_when = 'always'
})

-- local key = vim.api.nvim_set_keymap

local key = vim.keymap.set
local opts = { noremap = true, silent = true }
key("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR> <Cmd>lua require('hlslens').start()<CR>", opts)
key("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", opts)
key("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", opts)
key("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", opts)
key("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", opts)
key("n", "<c-c>", "<Cmd>nohlsearch<cr>", opts)
