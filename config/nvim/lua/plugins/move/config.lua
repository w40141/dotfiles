local M = {}

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

return M
