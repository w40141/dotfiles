local gl = require("core.global")
local augroup = gl.augroup
local autocmd = gl.autocmd

local myAutoCmd = augroup("MyAutoCmd", {})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
  group = myAutoCmd,
})
