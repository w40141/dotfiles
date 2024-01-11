local v = vim
local api = v.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

local myAutoCmd = augroup("MyAutoCmd", { clear = true })

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
	group = myAutoCmd,
})

local memoAutoCommit = augroup("MemoAutoCommit", { clear = true })
local pattern = "*/vault/**.md"

autocmd("VimLeave", {
	pattern = pattern,
	command = "MemoCommit",
	group = memoAutoCommit,
})
