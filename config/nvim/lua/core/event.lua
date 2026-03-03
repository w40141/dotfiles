local v = vim
local api = v.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

local my = augroup("MyAutoCmd", { clear = true })

autocmd("FileType", {
	group = my,
	pattern = "*",
	callback = function()
		-- formatoptions から c r o を外す（自動コメント継続を殺す）
		v.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

autocmd("QuitPre", {
	callback = function()
		-- 現在のウィンドウ番号を取得
		local current_win = api.nvim_get_current_win()
		-- すべてのウィンドウをループして調べる
		for _, win in ipairs(api.nvim_list_wins()) do
			-- カレント以外を調査
			if win ~= current_win then
				local buf = api.nvim_win_get_buf(win)
				-- buftypeが空文字（通常のバッファ）があればループ終了
				if vim.bo[buf].buftype == "" then
					return
				end
			end
		end
		-- ここまで来たらカレント以外がすべて特殊ウィンドウということなので
		-- カレント以外をすべて閉じる
		v.cmd.only({ bang = true })
		-- この後、ウィンドウ1つの状態でquitが実行されるので、Vimが終了する
	end,
	desc = "Close all special buffers and quit Neovim",
})
