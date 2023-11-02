local M = {}

function M.vim_test()
	local g = vim.g
	g["test#strategy"] = "neoterm"
	g["test#preserve_screen"] = 1
	g["test#python#runner"] = "pytest"
	g["test#java#runner"] = "gradletest"
	g["test#go#runner"] = "ginkgo"
end

return M
