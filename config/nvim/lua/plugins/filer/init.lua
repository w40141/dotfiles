local conf = require("plugins.filer.config")
local setup = require("plugins.filer.setup")

return {
	{
		-- File finder
		"nvim-tree/nvim-tree.lua",
		-- url = "https://github.com/nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setup.tree,
		config = conf.tree,
	},
}
