local conf = require("plugins.buffer.config")
local setup = require("plugins.buffer.setup")

return {
	{
		-- Buffer line
		"akinsho/bufferline.nvim",
		-- url = "https://github.com/akinsho/bufferline.nvim",
		event = { "VeryLazy" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = setup.bufferline,
		config = conf.bufferline,
	},
	{
		-- Delete buffers
		"famiu/bufdelete.nvim",
		-- url = "https://github.com/famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
		event = "CmdlineEnter",
	},
	{
		-- Delete multiple vim buffers based on different conditions
		'kazhala/close-buffers.nvim',
		-- url = "https://github.com/kazhala/close-buffers.nvim",
		init = setup.close,
		event = { "VeryLazy" },
	},
}
