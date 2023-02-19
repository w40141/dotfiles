local gl = require("core.global")
local api = gl.api
local augroup = gl.augroup
local autocmd = gl.autocmd

local myAutoCmd = augroup("MyAutoCmd", {})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
  group = myAutoCmd,
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    api.nvim_exec('silent! normal! g`"zv', false)
  end,
  group = myAutoCmd,
})
