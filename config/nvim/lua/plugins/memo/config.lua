local M = {}

-- function M.orgmode()
-- 	-- Setup orgmode
-- 	require("orgmode").setup({
-- 		org_agenda_files = "~/orgfiles/**/*",
-- 		org_default_notes_file = "~/orgfiles/refile.org",
-- 	})
-- end

function M.memolist()
	local v = vim
	local g = v.g
	g.memolist_memo_date = "%Y-%m-%d"
	g.memolist_filename_date = "%Y-%m-%dT%H:%M:%S-"
	g.memolist_path = "~/ghq/github.com/w40141/vault/Inbox"
	g.memolist_memo_suffix = "md"
	g.memolist_ex_cmd = "NvimTreeToggle"
	g.memolist_template_dir_path = "~/.config/memo/templates"
	g.memolist_delimiter_yaml_array = ","
	g.memolist_delimiter_yaml_start = "---"
	g.memolist_delimiter_yaml_end = "---"
	v.cmd([[command! -nargs=0 MemoCommit !memo commit]])
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
		new_notes_location = "notes_subdir",
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		wiki_link_func = function(opts)
			if opts.id == nil then
				return string.format("[[%s]]", opts.label)
			elseif opts.label ~= opts.id then
				return string.format("[[%s|%s]]", opts.id, opts.label)
			else
				return string.format("[[%s]]", opts.id)
			end
		end,
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			-- return new_title
			return (os.date("%Y-%m-%dT%H:%M:%S") .. "-" .. suffix)
		end,
		note_frontmatter_func = function(note)
			local out = { id = note.id, aliases = note.aliases, tags = note.tags }
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
			time_format = "%H:%M",
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
				today = function()
					return os.date("%Y-%m-%d")
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
				now = function()
					return os.date("%Y-%m-%dT%H:%M:%S")
				end,
			},
		},
		attachments = {
			img_folder = "Config/Extra",
		},
	})
end

return M
