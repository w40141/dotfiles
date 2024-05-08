local M = {}

function M.context_vt()
	require("nvim_context_vt").setup({
		enabled = true,
		-- prefix = "",
		-- highlight = "CustomContextVt",
		-- disable_ft = { "markdown" },
		disable_virtual_lines_ft = { "python", "yaml" },
		-- min_rows = 1,
		-- min_rows_ft = {},
	})
end

function M.hlargs()
	require("hlargs").setup()
end

function M.treesitter()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "all",
		ignore_install = { "org" },
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
		},
		autotag = {
			enable = true,
		},
	})
end

return M
