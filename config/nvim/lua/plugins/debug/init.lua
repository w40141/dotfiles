-- TODO: https://github.com/mfussenegger/nvim-dap
-- TODO: https://github.com/rcarriga/nvim-dap-ui
local conf = require("plugins.debug.config")
local setup = require("plugins.debug.setup")

return {
	{
		"mfussenegger/nvim-dap",
		-- url = "https://github.com/mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				-- url = "https://github.com/rcarriga/nvim-dap-ui",
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				-- url = "https://github.com/theHamsta/nvim-dap-virtual-text",
				config = conf.nvim_dap_virtual_text,
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				-- url = "https://github.com/jay-babu/mason-nvim-dap.nvim",
				dependencies = {
					"williamboman/mason.nvim",
					-- url = "https://github.com/williamboman/mason.nvim",
				},
			},
		},
		lazy = true,
		config = function()
			require("mason-nvim-dap").setup()
		end,
	},
}
