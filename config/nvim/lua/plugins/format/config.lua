local M = {}

function M.conform()
	local v = vim
	local conform = require("conform")

	-- local slow_format_filetypes = {}
	conform.setup({
		formatters_by_ft = {
			bash = { "shfmt" },
			elixir = { "mix" },
			fish = { "fish_indent" },
			go = { "gofumpt", "gofmt", "goimports", "golines" },
			javascript = { "prettier" },
			json = { "fixjson" },
			lua = { "stylua" },
			markdown = { "markdownlint", "markdown-toc", "prettier" },
			python = { "black" },
			sh = { "shfmt" },
			sql = { "sql_formatter" },
			yaml = { "yamlfmt" },
			xml = { "xmlformat" },
			["*"] = {
				"codespell",
			},
			["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" },
		},
		log_level = v.log.levels.ERROR,
		notify_on_error = true,
		-- format_on_save = function(bufnr)
		-- 	if slow_format_filetypes[v.bo[bufnr].filetype] then
		-- 		return
		-- 	end
		-- 	local function on_format(err)
		-- 		if err and err:match("timeout$") then
		-- 			slow_format_filetypes[v.bo[bufnr].filetype] = true
		-- 		end
		-- 	end
		-- 	return { timeout_ms = 200, lsp_fallback = true }, on_format
		-- end,
		-- format_after_save = function(bufnr)
		-- 	if not slow_format_filetypes[v.bo[bufnr].filetype] then
		-- 		return
		-- 	end
		-- 	return { lsp_fallback = true }
		-- end,
	})
end

return M
