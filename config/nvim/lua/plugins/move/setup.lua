local M = {}

function M.spider()
	local function f(name)
		return function()
			return require("spider").motion(name)
		end
	end

	local key = vim.keymap.set
	key({ "n", "o", "x" }, "w", f("w"), { desc = "[spider] 次の単語に移動 (w)" })
	key({ "n", "o", "x" }, "e", f("e"), { desc = "[spider] 次の単語の末尾に移動 (e)" })
	key({ "n", "o", "x" }, "b", f("b"), { desc = "[spider] 前の単語に移動 (b)" })
end

function M.flash()
	local function f(name)
		return function()
			return require("flash")[name]()
		end
	end

	local key = vim.keymap.set
	key({ "n", "x", "o" }, "<c-s>", f("jump"), { desc = "[flash] 文字ジャンプ (Flash)" })
	key({ "n", "x", "o" }, "S", f("treesitter"), { desc = "[flash] Treesitter でジャンプ" })
	key({ "o" }, "r", f("remote"), { desc = "[flash] リモートジャンプ (Remote Flash)" })
	key({ "x", "o" }, "R", f("treesitter_search"), { desc = "[flash] Treesitter 検索" })
	-- key({ "c" }, "<C-S>", f("toggle"), { desc = "[flash.nvim] Flash 検索の切り替え" })
end

return M
