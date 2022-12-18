return {
	function()
		local v = vim
		local actions = require("lir.actions")
		local mark_actions = require("lir.mark.actions")
		local clipboard_actions = require("lir.clipboard.actions")

		require("lir").setup({
			show_hidden_files = true,
			ignore = {},
			devicons_enable = true,
			mappings = {
				["l"] = actions.edit,
				["<c-s>"] = actions.split,
				["<c-v>"] = actions.vsplit,
				["<c-t>"] = actions.tabedit,

				["h"] = actions.up,
				["q"] = actions.quit,

				["K"] = actions.mkdir,
				["N"] = actions.newfile,
				["R"] = actions.rename,
				["@"] = actions.cd,
				["Y"] = actions.yank_path,
				["."] = actions.toggle_show_hidden,
				["D"] = actions.delete,

				["J"] = function()
					mark_actions.toggle_mark()
					v.cmd("normal! j")
				end,
				["C"] = clipboard_actions.copy,
				["X"] = clipboard_actions.cut,
				["P"] = clipboard_actions.paste,
			},
			float = {
				winblend = 0,
				curdir_window = {
					enable = false,
					highlight_dirname = false,
				},
			},
			hide_cursor = true,
			on_init = function()
				-- use visual mode
				v.api.nvim_buf_set_keymap(
					0,
					"x",
					"J",
					':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
					{ noremap = true, silent = true }
				)
				-- echo cwd
				v.api.nvim_echo({ { v.fn.expand("%:p"), "Normal" } }, false, {})
			end,
		})
	end
}