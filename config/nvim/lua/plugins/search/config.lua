local M = {}

function M.hlslens()
	require("hlslens").setup()
end

function M.kensaku()
	local key = vim.keymap.set
	-- key({ "c" }, "<CR>", "<Plug>(kensaku-search-replace)<CR>")
	key("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", {})
end
return M
