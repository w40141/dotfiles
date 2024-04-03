local M = {}

function M.previm()
	local v = vim
	local g = v.g
	g.mkdp_auto_close = 0
end

return M
