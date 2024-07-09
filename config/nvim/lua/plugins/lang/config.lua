local M = {}

function M.previm()
	vim.g.mkdp_auto_close = 0
end

function M.toc()
	require("nvim-toc").setup({
		toc_header = "Table of Contents"
	})
end

function M.markdown()
	require("render-markdown").setup()
end

function M.autotag()
	require("nvim-ts-autotag").setup()
end

return M
