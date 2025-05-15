local M = {}

function M.kensaku()
	local key = vim.keymap.set
	key("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", {})
end
return M
