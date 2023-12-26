local M = {}

function M.memolist()
	local v = vim
	local g = v.g
	local api = v.api
	g.memolist_path = "~/ghq/github.com/w40141/memolist/posts"
	g.memolist_memo_suffix = "md"
	g.memolist_fzf = 1
	g.memolist_template_dir_path = "$XDG_CONFIG_HOME/memo/templates"
	api.nvim_create_augroup("MemoAutoCommit", { clear = true })
	api.nvim_create_autocmd("BufEnter", {
		group = "MemoAutoCommit",
		pattern = "*/memolist/posts/*.md",
		callback = function()
			api.nvim_buf_set_var(0, "auto_save", 0)
		end,
	})
	api.nvim_create_autocmd("BufWritePost", {
		group = "MemoAutoCommit",
		pattern = "*/memolist/posts/*.md",
		command = "!memo commit",
	})
end

function M.toggleterm()
	require("toggleterm").setup({
		shade_terminals = false,
		shading_factor = "1",
		start_in_insert = false,
		insert_mappings = true,
		direction = "float",
		persist_size = false,
		close_on_exit = true,
		shell = "fish",
		float_opts = {
			border = "double",
			width = 150,
			height = 40,
			winblend = 2,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})
end

function M.hlslens()
	require("hlslens").setup()
end

return M
