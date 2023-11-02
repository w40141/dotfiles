local M = {}

function M.aerial()
	vim.keymap.set("n", "gt", "<Cmd>AerialToggle<CR>")
end

function M.bufferline()
	local key = vim.keymap.set

	key("n", "[b", "<Cmd>BufferLineCyclePrev<cr>")
	key("n", "]b", "<Cmd>BufferLineCycleNext<cr>")

	key("n", "bE", "<Cmd>BufferLineSortByExtension<cr>")
	key("n", "bD", "<Cmd>BufferLineSortByDirectory<cr>")
	key("n", "bg", "<Cmd>BufferLinePick<cr>")
end

function M.noice()
	local v = vim
	if not _G.__vim_notify_overwritten then
		v.notify = function(...)
			local args = { ... }
			require("notify")
			require("noice")
			v.schedule(function()
				v.notify(unpack(args))
			end)
		end
		_G.__vim_notify_overwritten = true
	end
end

function M.lualine()
	local v = vim
	v.opt.laststatus = 0
	v.opt.showtabline = 0
end

function M.nvimTree()
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>")
end

return M
