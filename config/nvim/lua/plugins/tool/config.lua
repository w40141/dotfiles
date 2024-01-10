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
			alias_format = "%Y%m%dT%H%M%S",
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
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return (os.date("%Y%m%dT%H%M%S") .. "-" .. suffix)
		end,
		note_frontmatter_func = function(note)
			local out = { id = note.id, aliases = note.aliases, tags = note.tags, created = os.date("%Y-%m-%dT%H:%M:%S") }
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end
			return out
		end,
		templates = {
			subdir = "Config/Templates",
			date_format = "%Y-%m-%d",
			substitutions = {
				year_kanji = function()
					return os.date("%Y年")
				end,
				month_kanji = function()
					return os.date("%Y年%m月")
				end,
				today_kanji = function()
					return os.date("%Y年%m月%d日")
				end,
				today_slash = function()
					return os.date("%Y/%m/%d")
				end,
				yesterday = function()
					return os.date("%Y-%m-%d", os.time() - day_sec)
				end,
				tomorrow = function()
					return os.date("%Y-%m-%d", os.time() + day_sec)
				end,
				a_week_before = function()
					return os.date("%Y-%m-%d", os.time() - week_sec)
				end,
				a_week_after = function()
					return os.date("%Y-%m-%d", os.time() + week_sec)
				end,
			},
		},
		attachments = {
			img_folder = "Config/Extra",
		},
	})
end

return M
