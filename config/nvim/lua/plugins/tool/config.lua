local M = {}

function M.memolist()
	local v = vim
	local g = v.g
	g.memolist_path = "~/ghq/github.com/w40141/memolist/posts"
	g.memolist_memo_suffix = "md"
	g.memolist_ex_cmd = "NvimTreeToggle"
	g.memolist_template_dir_path = "~/.config/memo/templates"
	g.memolist_delimiter_yaml_array = ","
	g.memolist_delimiter_yaml_start = "---"
	g.memolist_delimiter_yaml_end = "---"
	v.cmd([[command! -nargs=0 MemoCommit !memo commit]])
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

function M.chowcho()
	local v = vim
	local fn = v.fn
	local key = v.keymap.set
	local api = v.api
	local chowcho = require("chowcho")

	-- <C-w>xと<C-w><C-x>を同時に設定する
	local win_keymap_set = function(k, callback)
		key({ "n", "t" }, "<C-w>" .. k, callback)
		key({ "n", "t" }, "<C-w><C-" .. k .. ">", callback)
	end

	win_keymap_set("w", function()
		local wins = 0

		-- 全ウィンドウをループ
		for i = 1, fn.winnr("$") do
			local win_id = fn.win_getid(i)
			local conf = api.nvim_win_get_config(win_id)

			-- focusableなウィンドウをカウント
			if conf.focusable then
				wins = wins + 1

				-- ウィンドウ数が3以上ならchowchoを起動
				if wins > 2 then
					chowcho.run()
					return
				end
			end
		end

		-- ウィンドウが少なければ標準の<C-w><C-w>を実行
		api.nvim_command("wincmd w")
	end)

	require("chowcho").setup({
		icon_enabled = true, -- required 'nvim-web-devicons' (default: false)
		text_color = "#FFFFFF",
		bg_color = "#555555",
		active_border_color = "#0A8BFF",
		border_style = "default",
		use_exclude_default = false,
		exclude = function(buf, win)
			-- Exclude a window from the choice based on its buffer information.
			-- This option is applied iff `use_exclude_default = false`.
			-- Note that below is identical to the `use_exclude_default = true`.
			local fname = fn.expand("#" .. buf .. ":t")
			return fname == ""
		end,
		zindex = 10000, -- sufficiently large value to show on top of the other windows
	})
end

return M
