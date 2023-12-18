local M = {}

function M.previm()
	local v = vim
	local g = v.g
	g.previm_open_cmd = [[open -a Google\ Chrome]]
	g.previm_enable_realtime = 1
	v.keymap.set("n", ",o", "<Cmd>PrevimOpen<cr>")
end

return M
