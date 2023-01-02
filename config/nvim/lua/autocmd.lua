local v = vim
local api = v.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

local mac = augroup("MyAutoCmd", {})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
	group = mac,
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		v.api.nvim_exec('silent! normal! g`"zv', false)
	end,
	group = mac,
})
