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

	key("n", "<silent><leader>1", "<Cmd>BufferLineGoToBuffer 1<cr>")
	key("n", "<silent><leader>2", "<Cmd>BufferLineGoToBuffer 2<cr>")
	key("n", "<silent><leader>3", "<Cmd>BufferLineGoToBuffer 3<cr>")
	key("n", "<silent><leader>4", "<Cmd>BufferLineGoToBuffer 4<cr>")
	key("n", "<silent><leader>5", "<Cmd>BufferLineGoToBuffer 5<cr>")
	key("n", "<silent><leader>6", "<Cmd>BufferLineGoToBuffer 6<cr>")
	key("n", "<silent><leader>7", "<Cmd>BufferLineGoToBuffer 7<cr>")
	key("n", "<silent><leader>8", "<Cmd>BufferLineGoToBuffer 8<cr>")
	key("n", "<silent><leader>9", "<Cmd>BufferLineGoToBuffer 9<cr>")
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

function M.lir()
	vim.keymap.set("n", "<leader>e", function()
		require("lir.float").toggle()
	end)
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
