local gl = require("core.global")
local v = gl.v
local fn = gl.fn
local opt = gl.opt

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not v.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- { import = "modulesTmp.complement" },
		-- { import = "modulesTmp.lsp" },
		-- { import = "modulesTmp.edit" },
		-- { import = "modulesTmp.tool" },
		-- { import = "modulesTmp.treesitter" },
		-- { import = "modulesTmp.fzf" },
		{ import = "modulesTmp.ui" },
		-- { import = "modulesTmp.lang" },
		-- { import = "modulesTmp.misc" },
	},
})
