local M = {}

function M.nvim_dap_virtual_text()
	require("nvim-dap-virtual-text").setup()
end

function M.nvim_dap()
	local dap = require("dap")
	require("mason-nvim-dap").setup()
end

return M
