local conf = require("modules.treesitter.config")
local setup = require("modules.treesitter.setup")

local function e(p)
	p.event = { "BufNewFile", "BufReadPre", "BufRead" }
	p.wants = { "nvim-treesitter" }
	return p
end

return {
	e({
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = conf.treesitter,
	}),
	e({ "nvim-treesitter/nvim-treesitter-textobjects" }),
	e({ "yioneko/nvim-yati" }),
	e({ "m-demare/hlargs.nvim" }),
	-- e({"mrjones2014/nvim-ts-rainbow"}),
	-- e({ "p00f/nvim-ts-rainbow" }),
	e({ "haringsrob/nvim_context_vt" }),
	-- TODO: https://github.com/mfussenegger/nvim-treehopper
	-- e({
	-- 	"mfussenegger/nvim-treehopper",
	-- 	module = { "tsht" },
	-- 	setup = setup.treehopper,
	-- }),
}
