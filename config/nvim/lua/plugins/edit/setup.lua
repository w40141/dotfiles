local M = {}

function M.ufo()
	local function f(name)
		return function()
			return require("ufo")[name]()
		end
	end

	local key = vim.keymap.set
	key("n", "zR", f("openAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを開く" })
	key("n", "zM", f("closeAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを閉じる" })
	key("n", "zr", f("openFoldsExceptKinds"), { desc = "[nvim-ufo] 指定以外の折り畳みを開く" })
	key("n", "zm", f("closeFoldsWith"), { desc = "[nvim-ufo] 指定レベル以上の折り畳みを閉じる" })
end

function M.dial()
	local function fi(mode)
		return function()
			return require("dial.map").manipulate("increment", mode)
		end
	end

	local function fd(mode)
		return function()
			return require("dial.map").manipulate("decrement", mode)
		end
	end

	local key = vim.keymap.set
	key("n", "<C-a>", fi("normal"), { desc = "インクリメント" })
	key("n", "<C-x>", fd("normal"), { desc = "デクリメント" })
	key("n", "g<C-a>", fi("gnormal"), { desc = "インクリメント" })
	key("n", "g<C-x>", fd("gnormal"), { desc = "デクリメント" })
	key("v", "<C-a>", fi("visual"), { desc = "インクリメント" })
	key("v", "<C-x>", fd("visual"), { desc = "デクリメント" })
	key("v", "g<C-a>", fi("gvisual"), { desc = "インクリメント" })
	key("v", "g<C-x>", fd("gvisual"), { desc = "デクリメント" })
end

return M
