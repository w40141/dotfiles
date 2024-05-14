local M = {}

function M.virtual_text()
	require("nvim-dap-virtual-text").setup()
end

function M.dap()
	-- local dap = require("dap")
	require("mason-nvim-dap").setup()
end

return M
