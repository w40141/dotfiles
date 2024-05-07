local M = {}

function M.spider()
	local function f(name)
		return function()
			return require("spider").motion(name)
		end
	end

	local key = vim.keymap.set
	key({ "n", "o", "x" }, "w", f("w"), { desc = "Spider-w" })
	key({ "n", "o", "x" }, "e", f("e"), { desc = "Spider-e" })
	key({ "n", "o", "x" }, "b", f("b"), { desc = "Spider-b" })
end

function M.flash()
	local function f(name)
		return function()
			return require("flash")[name]()
		end
	end

	local key = vim.keymap.set
	key({ "n", "x", "o" }, "<c-s>", f("jump"), { desc = "Flash" })
	key({ "n", "x", "o" }, "S", f("treesitter"), { desc = "Flash Treesitter" })
	key({ "o" }, "r", f("remote"), { desc = "Remote Flash" })
	key({ "x", "o" }, "R", f("treesitter_search"), { desc = "Treesitter Search" })
	-- key({ "c" }, "<C-S>", f("toggle"), { desc = "Toggle Flash Search" })
end

return M
