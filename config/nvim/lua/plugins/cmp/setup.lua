local M = {}

function M.skkeleton()
	local key = vim.keymap.set
	key({ "i", "c" }, "jk", "<Plug>(skkeleton-enable)", { desc = "[skkeleton] skkeletonをトグル" })
end

return M
