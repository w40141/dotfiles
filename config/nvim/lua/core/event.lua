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
local pattern = "*/memolist/posts/*.md"

autocmd("BufEnter", {
	pattern = pattern,
	callback = function()
		api.nvim_buf_set_var(0, "auto_save", 0)
	end,
	group = memoAutoCommit,
})

autocmd("BufWritePost", {
	pattern = pattern,
	command = "!memo commit",
	group = memoAutoCommit,
})
