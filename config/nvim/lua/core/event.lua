local v = vim
local augroup = v.api.nvim_create_augroup
local autocmd = v.api.nvim_create_autocmd

local myAutoCmd = augroup("MyAutoCmd", {})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
	group = myAutoCmd,
})
