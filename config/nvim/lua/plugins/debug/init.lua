-- TODO: https://github.com/mfussenegger/nvim-dap
-- TODO: https://github.com/rcarriga/nvim-dap-ui
local conf = require("plugins.debug.config")

return {
	{
		"mfussenegger/nvim-dap",
		-- url = "https://github.com/mfussenegger/nvim-dap",
		lazy = true,
		config = conf.dap,
	},
	{
		"rcarriga/nvim-dap-ui",
		-- url = "https://github.com/rcarriga/nvim-dap-ui",
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		-- url = "https://github.com/theHamsta/nvim-dap-virtual-text",
		config = conf.virtual_text,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		-- url = "https://github.com/jay-babu/mason-nvim-dap.nvim",
	},
}
