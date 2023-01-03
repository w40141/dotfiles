local M = {}

function M.toggleterm()
	local v = vim
	require("toggleterm").setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return v.o.columns * 0.4
			end
		end,
		open_mapping = [[<c-;>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = false,
		shading_factor = "1",
		start_in_insert = true,
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

function M.neogit()
	require("neogit").setup()
end

return M
