local M = {}

function M.lualine()
	local v = vim
	v.opt.laststatus = 0
	v.opt.showtabline = 0
end

return M
