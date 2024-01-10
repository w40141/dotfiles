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

	chowcho.setup({
		icon_enabled = true, -- required 'nvim-web-devicons' (default: false)
		text_color = "#FFFFFF",
		bg_color = "#555555",
		active_border_color = "#0A8BFF",
		border_style = "default",
		use_exclude_default = false,
		exclude = function(buf, _)
			local fname = fn.expand("#" .. buf .. ":t")
			return fname == ""
		end,
		zindex = 10000, -- sufficiently large value to show on top of the other windows
	})
end

function M.obsidian()
	local obsidian = require("obsidian")
	local day_sec = 60 * 60 * 24
	local week_sec = day_sec * 7
	local padding = function(s)
		return string.format("%02d", s)
	end
	local split_slash = function(y, m, d)
		return (y .. "/" .. m .. "/" .. d)
	end
	local split_hyphen = function(y, m, d)
		return (y .. "-" .. m .. "-" .. d)
	end
	local date = function(time, f)
		local tmp = os.date("*t", os.time() + time)
		return f(tmp.year, padding(tmp.month), padding(tmp.day))
	end

	obsidian.setup({
		workspaces = {
			{
				name = "vault",
				path = "~/ghq/github.com/w40141/vault",
			},
		},
		notes_subdir = "Inbox",
		daily_notes = {
			folder = "Daily",
			date_format = "%Y-%m-%d",
			alias_format = "%Y%m%d%H%M%S",
			template = "DailyNvim.md",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
			new_notes_location = "notes_subdir",
			prepend_note_id = true,
			prepend_note_path = false,
			use_path_only = false,
		},
		note_frontmatter_func = function(note)
			-- This is equivalent to the default frontmatter function.
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }
			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end
			return out
		end,
		templates = {
			subdir = "Config/Templates",
			date_format = "%Y/%m/%d",
			substitutions = {
				year_kanji = function()
					return (os.date("%Y") .. "年")
				end,
				month_kanji = function()
					local month = padding(os.date("%m"))
					return (os.date("%Y") .. "年" .. month .. "月")
				end,
				today_kanji = function()
					local day = padding(os.date("%d"))
					local month = padding(os.date("%m"))
					return (os.date("%Y") .. "年" .. month .. "月" .. day .. "日")
				end,
				-- today_slash = function()
				-- 	return date(0, split_slash)
				-- end,
				today_hyphen = function()
					return date(0, split_hyphen)
				end,
				-- tomorrow_slash = function()
				-- 	return date(day_sec, split_slash)
				-- end,
				tomorrow_hyphen = function()
					return date(day_sec, split_hyphen)
				end,
				-- yesterday_slash = function()
				-- 	return date(-day_sec, split_slash)
				-- end,
				yesterday_hyphen = function()
					return date(-day_sec, split_hyphen)
				end,
				-- one_week_before_slash = function()
				-- 	return date(-week_sec, split_slash)
				-- end,
				one_week_before_hyphen = function()
					return date(-week_sec, split_hyphen)
				end,
				-- one_week_after_slash = function()
				-- 	return date(week_sec, split_slash)
				-- end,
				one_week_after_hyphen = function()
					return date(week_sec, split_hyphen)
				end,
			},
		},
		attachments = {
			img_folder = "Config/Extra",
		},
	})
end

return M
