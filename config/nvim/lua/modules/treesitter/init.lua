local conf = require("modules.treesitter.config")

local function e(p)
	p.event = { "BufNewFile", "BufRead", "FocusLost", "CursorHold" }
	p.wants = { "nvim-treesitter" }
	return p
end

return {
	e({
		-- Treesitter configurations
		-- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = conf.treesitter,
	}),
	e({ "nvim-treesitter/nvim-treesitter-textobjects" }),
	e({ "yioneko/nvim-yati" }),
	e({ "m-demare/hlargs.nvim" }),
	e({ "p00f/nvim-ts-rainbow" }),
	e({ "haringsrob/nvim_context_vt" }),
}
